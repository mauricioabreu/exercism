defmodule Tournament.Table do
  @team_padding   30
  @stats_padding  2
  @header         "Team                           | MP |  W |  D |  L |  P"

  def print(stats) do
    [ @header | Enum.map(stats, &line/1) ]
    |> Enum.join("\n")
  end

  defp line({team, stats}) do
    [
      format_team(team),
      format_stats(stats.played),
      format_stats(stats.wins),
      format_stats(stats.draws),
      format_stats(stats.losses),
      format_stats(stats.points),
    ] |> Enum.join(" | ")
  end

  defp format_team(team) do
    String.pad_trailing(team, @team_padding)
  end

  defp format_stats(stat) do
    String.pad_leading(to_string(stat), @stats_padding)
  end
end
