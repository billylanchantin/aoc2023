defmodule Aoc2023.Day03.Part2 do
  alias Aoc2023.Day03.Part1

  def solve(file_path), do: file_path |> File.read!() |> solve_contents()

  def solve_contents(contents) do
    parts = Part1.find_parts(contents)

    gears = parts |> Enum.filter(fn {{_, _, c}, l} -> c == ?* and length(l) == 2 end)
    gears |> Enum.map(fn {_, l} -> Enum.product(l) end) |> Enum.sum()
  end
end
