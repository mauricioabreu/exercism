defmodule Raindrops do
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t
  def convert(number) do
    filtered = Enum.map([3, 5, 7], fn(n) -> rem(number, n) == 0 end)
    Enum.zip(["Pling", "Plang", "Plong"], filtered) |>
    Enum.filter_map(fn(x) -> elem(x, 1) == true end, &(elem(&1, 0))) |>
    output(number)
  end

  defp output(primes, number) do
    if Enum.empty?(primes) do
      Integer.to_string(number)
    else
      Enum.join(primes)
    end
  end
end
