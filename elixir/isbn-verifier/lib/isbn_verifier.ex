defmodule IsbnVerifier do
  @doc """
    Checks if a string is a valid ISBN-10 identifier

    ## Examples

      iex> IsbnVerifier.isbn?("3-598-21507-X")
      true

      iex> IsbnVerifier.isbn?("3-598-2K507-0")
      false

  """
  @spec isbn?(String.t()) :: boolean
  def isbn?(isbn) do
    String.replace(isbn, "-", "")
    |> String.to_charlist()
    |> is_valid?()
  end

  defp is_valid?(digits) when length(digits) == 10 do
    sum = Enum.zip(digits, 10..1)
    |> Enum.reduce_while(0, fn
      {digit, n}, sum when digit in ?0..?9 ->
        {:cont, sum + (digit - ?0) * n}
      {?X, n}, sum ->
        {:cont, sum + 10 * n}
      _, _ ->
        {:halt, -1}
    end)
    |> rem(11)

    sum == 0
  end

  defp is_valid?(_), do: false
end
