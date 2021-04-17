defmodule TwelveDays do
  @gifts [
    "a Partridge in a Pear Tree",
    "two Turtle Doves",
    "three French Hens",
    "four Calling Birds",
    "five Gold Rings",
    "six Geese-a-Laying",
    "seven Swans-a-Swimming",
    "eight Maids-a-Milking",
    "nine Ladies Dancing",
    "ten Lords-a-Leaping",
    "eleven Pipers Piping",
    "twelve Drummers Drumming",
  ]

  @days [
    "first",
    "second",
    "third",
    "fourth",
    "fifth",
    "sixth",
    "seventh",
    "eighth",
    "ninth",
    "tenth",
    "eleventh",
    "twelfth",
  ]

  @doc """
  Given a `number`, return the song's verse for that specific day, including
  all gifts for previous days in the same line.
  """
  @spec verse(number :: integer) :: String.t()
  def verse(number) do
    "On the #{day(number)} day of Christmas my true love gave to me: #{give_gifts(number)}"
  end

  @doc """
  Given a `starting_verse` and an `ending_verse`, return the verses for each
  included day, one per line.
  """
  @spec verses(starting_verse :: integer, ending_verse :: integer) :: String.t()
  def verses(starting_verse, ending_verse) do
    starting_verse..ending_verse
    |> Enum.reduce("", fn n, acc -> acc <> verse(n) <> "\n" end)
    |> String.trim()
  end

  @doc """
  Sing all 12 verses, in order, one verse per line.
  """
  @spec sing() :: String.t()
  def sing do
    verses(1, 12)
  end

  def give_gifts(1) do
    "a Partridge in a Pear Tree."
  end

  def give_gifts(number) do
    gifts = Enum.slice(@gifts, 1..number - 1)
    |> Enum.reverse
    |> Enum.join(", ")
    gifts <> ", and " <> give_gifts(1)
  end

  def day(number) do
    get_in(@days, [Access.at!(number - 1)])
  end
end
