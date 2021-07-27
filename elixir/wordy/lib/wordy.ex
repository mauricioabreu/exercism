defmodule Wordy do
  @doc """
  Calculate the math problem in the sentence.
  """
  @spec answer(String.t()) :: integer
  def answer(question) do
    question
    |> String.split(~r/[-+]?\d+([\d\.]+)?|\?/, trim: true, include_captures: true)
    |> parse_tokens()
    |> calculate()
  end

  defp parse_tokens(tokens) do
    tokens
    |> Enum.map(fn token ->
      case Integer.parse(token) do
        {i, ""} -> i
        _ -> token |> String.trim() |> String.downcase()
      end
    end)
  end

  defp calculate(["what is", number | tokens]) do
    calculate(tokens, number)
  end

  defp calculate([operation, other_number | tokens], number) do
    result = do_math(operation, number, other_number)
    calculate(tokens, result)
  end

  defp calculate(["?"], result) do
    result
  end

  defp calculate(_) do
    raise ArgumentError
  end

  defp do_math("plus", a, b), do: a + b
  defp do_math("minus", a, b), do: a - b
  defp do_math("multiplied by", a, b), do: a * b
  defp do_math("divided by", a, b), do: a / b
  defp do_math(_, _a, _b), do: raise ArgumentError
end
