defmodule BeerSong do
  @doc """
  Get a single verse of the beer song
  """
  @spec verse(integer) :: String.t()
  def verse(number) do
    """
    #{String.capitalize(beers_on_the_wall(number))} of beer on the wall, #{beers_on_the_wall(number)} of beer.
    #{take_or_buy(number)}, #{remaining_bottles(number)} of beer on the wall.
    """
  end

  @doc """
  Get the entire beer song for a given range of numbers of bottles.
  """
  @spec lyrics() :: String.t()
  def lyrics() do
    lyrics(99..0)
  end

  @spec lyrics(Range.t()) :: String.t()
  def lyrics(range) do
    Enum.reduce(range, "", fn n, acc -> acc <> "\n" <> verse(n) end)
    |> String.trim_leading()
  end

  defp beers_on_the_wall(1) do
    "1 bottle"
  end
  defp beers_on_the_wall(0) do
    "no more bottles"
  end
  defp beers_on_the_wall(number) do
    "#{number} bottles"
  end

  defp remaining_bottles(0) do
    "99 bottles"
  end
  defp remaining_bottles(number) do
    beers_on_the_wall(number-1)
  end

  defp take_or_buy(1) do
    "Take it down and pass it around"
  end
  defp take_or_buy(0) do
    "Go to the store and buy some more"
  end
  defp take_or_buy(_number) do
    "Take one down and pass it around"
  end
end
