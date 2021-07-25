defmodule Dominoes do
  @type domino :: {1..6, 1..6}

  @doc """
  chain?/1 takes a list of domino stones and returns boolean indicating if it's
  possible to make a full chain
  """
  def chain?([]) do
    true
  end

  @spec chain?(dominoes :: [domino] | []) :: boolean
  def chain?([domino | dominoes]) do
    chain?(domino, dominoes)
  end

  def chain?({first, last}, []) do
    first == last
  end

  def chain?(stone, dominoes) do
    Enum.any?(dominoes, &chain?(stone, &1, List.delete(dominoes, &1)))
  end

  # compare two stones, e.g: {1, 2} - {2, 3}
  def chain?({first, last}, {last, right}, dominoes), do: chain?({first, right}, dominoes)
  def chain?({first, last}, {left, last}, dominoes), do: chain?({first, left}, dominoes)
  def chain?(_stone,  _nstone, _dominoes) do
    false
  end
end
