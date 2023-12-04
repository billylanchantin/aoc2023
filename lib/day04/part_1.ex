defmodule Aoc2023.Day04.Part1 do
  def solve(file_path), do: file_path |> File.read!() |> solve_contents()

  def solve_contents(contents) do
    lines = String.split(contents, "\n")

    lines
    |> Enum.map(&count_matching/1)
    |> Enum.reduce(0, fn n, sum -> sum + if(n == 0, do: 0, else: 2 ** (n - 1)) end)
  end

  def count_matching(line) do
    [_, nums] = String.split(line, ": ")

    nums
    |> String.split(" | ")
    |> Enum.map(fn s -> s |> String.split(" ", trim: true) |> Enum.map(&String.to_integer/1) end)
    |> Enum.map(&MapSet.new/1)
    |> then(&apply(MapSet, :intersection, &1))
    |> MapSet.size()
  end
end
