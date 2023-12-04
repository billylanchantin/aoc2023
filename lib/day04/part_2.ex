defmodule Aoc2023.Day04.Part2 do
  alias Aoc2023.Day04.Part1

  def solve(file_path), do: file_path |> File.read!() |> solve_contents()

  def solve_contents(contents) do
    counts =
      contents
      |> String.split("\n")
      |> Enum.with_index(1)
      |> Map.new(fn {l, i} -> {i, Enum.to_list(i..(i + Part1.count_matching(l))) -- [i]} end)

    rec(map_size(counts), Map.keys(counts), counts)
  end

  def rec(sum, [], _), do: sum

  def rec(sum, cards, counts) do
    new = Enum.flat_map(cards, &Map.get(counts, &1))
    rec(sum + length(new), new, counts)
  end
end
