defmodule Raindrops do
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """

  @pwords %{3 => "Pling", 5 => "Plang", 7 => "Plong"}

  @spec convert(pos_integer) :: String.t
  def convert(number) do
    Map.keys(@pwords)
    |> Enum.map(&(psound(number, &1)))
    |> Enum.join
    |> output(number)
  end

  defp psound(number, divisible) do
    if rem(number, divisible) == 0, do: @pwords[divisible]
  end

  defp output(pwords, number) do
    if pwords == "", do: to_string(number), else: pwords
  end
end
