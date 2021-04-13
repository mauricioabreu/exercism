defmodule SumOfMultiples do
  @doc """
  Adds up all numbers from 1 to a given end number that are multiples of the factors provided.
  """
  @spec to(non_neg_integer, [non_neg_integer]) :: non_neg_integer
  def to(limit, factors) do
    Enum.to_list(1..limit-1)
    |> Enum.filter(fn x -> is_factor_of?(x, factors) end)
    |> Enum.sum
  end

  def is_factor_of?(number, factors) do
    Enum.any?(factors, fn n -> rem(number, n) == 0 end)
  end
end
