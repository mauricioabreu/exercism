defmodule Tournament do
  alias Tournament.Stats
  alias Tournament.Table

  @doc """
  Given `input` lines representing two teams and whether the first of them won,
  lost, or reached a draw, separated by semicolons, calculate the statistics
  for each team's number of games played, won, drawn, lost, and total points
  for the season, and return a nicely-formatted string table.

  A win earns a team 3 points, a draw earns 1 point, and a loss earns nothing.

  Order the outcome by most total points for the season, and settle ties by
  listing the teams in alphabetical order.
  """
  @win  %Stats{played: 1, wins: 1, draws: 0, losses: 0, points: 3}
  @draw %Stats{played: 1, wins: 0, draws: 1, losses: 0, points: 1}
  @loss %Stats{played: 1, wins: 0, draws: 0, losses: 1, points: 0}

  @spec tally(input :: list(String.t())) :: String.t()
  def tally(input) do
    make_stats(input)
    |> order()
    |> print()
  end

  defp make_stats(input) do
    Enum.reduce(input, %{}, &make_stats/2)
  end

  defp make_stats(match, stats) do
    case String.split(match, ";") do
      [team1, team2, result] -> make_stats(stats, team1, team2, result)
      _ -> stats
    end
  end

  defp make_stats(stats, team1, team2, "win") do
    count_win(stats, team1) |> count_loss(team2)
  end

  defp make_stats(stats, team1, team2, "draw") do
    count_draw(stats, team1) |> count_draw(team2)
  end

  defp make_stats(stats, team1, team2, "loss") do
    count_win(stats, team2) |> count_loss(team1)
  end

  defp make_stats(stats, team1, team2, _result) do
    stats
  end

  defp count_win(stats, team) do
    Map.update(stats, team, @win, fn s -> %Stats{
      s | played: s.played + 1, wins: s.wins + 1, points: s.points + 3
    } end)
  end

  defp count_draw(stats, team) do
    Map.update(stats, team, @draw, fn s -> %Stats{
      s | played: s.played + 1, draws: s.draws + 1, points: s.points + 1
    } end)
  end

  defp count_loss(stats, team) do
    Map.update(stats, team, @loss, fn s -> %Stats{
      s | played: s.played + 1, losses: s.losses + 1, points: s.points + 0
    } end)
  end

  defp order(stats) do
    Enum.to_list(stats)
    |> Enum.sort_by(fn {name, info} -> {-info.points, name} end)
  end

  defp print(stats) do
    Table.print(stats)
  end
end
