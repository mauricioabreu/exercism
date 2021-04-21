defmodule Clock do
  defstruct hour: 0, minute: 0

  defimpl String.Chars, for: Clock do
    def padding(p) do
      String.pad_leading(Integer.to_string(p), 2, "0")
    end

    def to_string(c) do
      "#{padding(c.hour)}:#{padding(c.minute)}"
    end
  end

  @doc """
  Returns a clock that can be represented as a string:

      iex> Clock.new(8, 9) |> to_string
      "08:09"
  """
  @spec new(integer, integer) :: Clock
  def new(hour, minute) do
    add(%Clock{}, hour * 60 + minute)
  end

  @doc """
  Adds two clock times:

      iex> Clock.new(10, 0) |> Clock.add(3) |> to_string
      "10:03"
  """
  @spec add(Clock, integer) :: Clock
  def add(%Clock{hour: hour, minute: minute}, add_minute) do
    minutes = minute + add_minute
    hours = hour + Integer.floor_div(minutes, 60)
    %Clock{
      hour: Integer.mod(hours, 24),
      minute: Integer.mod(minutes, 60)
    }
  end
end
