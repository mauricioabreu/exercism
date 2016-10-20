defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) do
    to_words(sentence) |>
    summarize
  end

  defp to_words(sentence) do
    Regex.scan(~r/(*UTF)[\p{L}0-9-]+/i, String.downcase(sentence)) |> 
    Enum.map(&List.first/1)
  end

  defp summarize(words) do
    Enum.reduce(words, %{}, &counter/2)
  end
  
  defp counter(word, map) do
    Map.update(map, word, 1, &(&1 + 1))
  end
end
