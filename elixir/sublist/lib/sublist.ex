defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) do
    cond do
      is_equal?(a, b) -> :equal
      is_in?(b, a) -> :sublist
      is_in?(a, b) -> :superlist
      true -> :unequal
    end
  end

  defp is_equal?(a, b) do
    a === b
  end

  defp is_in?(a, b) when length(a) < length(b) do
    false
  end
  defp is_in?(a, b) do
    is_equal?(Enum.take(a, length(b)), b) or is_in?(tl(a), b)
  end
end
