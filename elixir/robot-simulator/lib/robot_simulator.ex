defmodule RobotSimulator do
  @doc """
  Create a Robot Simulator given an initial direction and position.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec create(direction :: atom, position :: {integer, integer}) :: any
  def create(direction \\ :north, position \\ {0, 0}) do
    cond do
      !valid_direction?(direction) ->
        {:error, "invalid direction"}
      !valid_position?(position) ->
        {:error, "invalid position"}
      true ->
        %{direction: direction, position: position}
    end
  end

  defp valid_direction?(direction) do
    direction in [:north, :east, :south, :west]
  end

  defp valid_position?({x, y}) do
    is_integer(x) and is_integer(y)
  end
  defp valid_position?(_), do: false

  defp valid_instructions?(instructions) do
    String.match?(instructions, ~r/^[LRA]+$/)
  end

  @doc """
  Simulate the robot's movement given a string of instructions.

  Valid instructions are: "R" (turn right), "L", (turn left), and "A" (advance)
  """
  @spec simulate(robot :: any, instructions :: String.t()) :: any
  def simulate(robot, instructions) do
    case valid_instructions?(instructions) do
      false -> {:error, "invalid instruction"}
      true -> String.graphemes(instructions)
              |> Enum.reduce(robot, &walk(&2, &1))
    end
  end

  defp walk(robot = %{direction: :north, position: {x, y}}, "A") do
    %{robot | position: {x, y + 1}}
  end

  defp walk(robot = %{direction: :south, position: {x, y}}, "A") do
    %{robot | position: {x, y - 1}}
  end

  defp walk(robot = %{direction: :east, position: {x, y}}, "A") do
    %{robot | position: {x + 1, y}}
  end

  defp walk(robot = %{direction: :west, position: {x, y}}, "A") do
    %{robot | position: {x - 1, y}}
  end

  defp walk(robot = %{direction: :north}, "L"), do: %{robot | direction: :west}
  defp walk(robot = %{direction: :north}, "R"), do: %{robot | direction: :east}

  defp walk(robot = %{direction: :east},  "L"), do: %{robot | direction: :north}
  defp walk(robot = %{direction: :east},  "R"), do: %{robot | direction: :south}

  defp walk(robot = %{direction: :west},  "L"), do: %{robot | direction: :south}
  defp walk(robot = %{direction: :west},  "R"), do: %{robot | direction: :north}

  defp walk(robot = %{direction: :south}, "L"), do: %{robot | direction: :east}
  defp walk(robot = %{direction: :south}, "R"), do: %{robot | direction: :west}


  @doc """
  Return the robot's direction.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec direction(robot :: any) :: atom
  def direction(robot) do
    robot.direction
  end

  @doc """
  Return the robot's position.
  """
  @spec position(robot :: any) :: {integer, integer}
  def position(robot) do
    robot.position
  end
end
