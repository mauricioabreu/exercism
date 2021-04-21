defmodule Luhn do
  @doc """
  Checks if the given number is valid via the luhn formula
  """
  @spec valid?(String.t()) :: boolean
  def valid?(number) do
    number = remove_spaces(number)
    valid?(number, is_valid_format?(number))
  end

  defp valid?(_number, false), do: false
  defp valid?(number, true) do
    apply_luhn(number)
  end

  def apply_luhn(number) do
    filter_numbers(number)
    |> Enum.reverse()
    |> Enum.chunk_every(2)
    |> Enum.reduce(0, fn
      [first, second], sum -> sum + first + double(second)
      [first], sum -> sum + first
    end)
    |> rem(10) == 0
  end

  defp double(n) do
    res = n * 2
    if res > 9 do
      res - 9
    else
      res
    end
  end

  defp remove_spaces(number) do
    String.replace(number, " ", "")
  end

  defp filter_numbers(number) do
    String.split(number, "", trim: true)
    |> Enum.flat_map(fn s ->
      case Integer.parse(s) do
        {n, _rest} -> [n]
        :error -> []
      end
    end)
  end

  defp is_valid_format?(number) do
   String.match?(number, ~r/^[[:digit:]]{2,}$/)
  end
end
