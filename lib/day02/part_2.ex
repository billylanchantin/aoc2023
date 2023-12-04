defmodule Aoc2023.Day02.Part2 do
  alias Aoc2023.Day02.Part1

  def solve(file_path), do: file_path |> File.read!() |> solve_contents()

  def solve_contents(contents) do
    contents
    |> String.split("\n")
    |> Enum.map(&Part1.line_to_game/1)
    |> Enum.map(fn {_, game} -> Part1.game_maxes(game) end)
    |> Enum.map(&game_score/1)
    |> Enum.sum()
  end

  def game_score(game), do: game |> Map.values() |> Enum.product()
end
