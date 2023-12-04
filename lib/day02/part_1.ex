defmodule Aoc2023.Day02.Part1 do
  def solve(file_path, bag), do: file_path |> File.read!() |> solve_contents(bag)

  def solve_contents(contents, bag) do
    contents
    |> String.split("\n")
    |> Enum.map(&line_to_game/1)
    |> Enum.flat_map(fn {game_id, game} ->
      if game_possible?(game, bag), do: [game_id], else: []
    end)
    |> Enum.sum()
  end

  def line_to_game(line) do
    ["Game " <> game_id, game_string] = String.split(line, ": ")

    game =
      game_string
      |> String.split("; ")
      |> Enum.map(fn draw_string ->
        draw_string
        |> String.split(", ")
        |> Enum.map(&String.split(&1, " "))
        |> Map.new(fn [count, color] -> {color, String.to_integer(count)} end)
      end)

    {String.to_integer(game_id), game}
  end

  def game_possible?(game, bag) do
    maxes = game_maxes(game)
    Enum.all?(bag, fn {k, v} -> maxes[k] <= v end)
  end

  def game_maxes(game) do
    Enum.reduce(game, %{}, fn m1, m2 ->
      Map.merge(m1, m2, fn _k, v1, v2 -> max(v1, v2) end)
    end)
  end
end
