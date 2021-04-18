defmodule Scrabble do
  @doc """
  Calculate the scrabble score for the word.
  """

  @values_table %{
    1  => ~c(aeioulnrst),
    2  => ~c(dg),
    3  => ~c(bcmp),
    4  => ~c(fhvwy),
    5  => ~c(k),
    8  => ~c(jx),
    10 => ~c(qz),
  }

  # more info about for: https://elixir-lang.org/getting-started/comprehensions.html
  @scores for {points, letters} <- @values_table,
          l <- letters,
          into: %{},
          do: {l, points}


  @spec score(String.t()) :: non_neg_integer
  def score(word) do
    word
    |> String.trim
    |> String.downcase
    |> to_char_list
    |> Enum.reduce(0, fn l, acc -> Map.get(@scores, l, 0) + acc end)
  end
end
