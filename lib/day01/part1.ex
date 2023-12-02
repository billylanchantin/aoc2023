defmodule Aoc2023.Day01.Part1 do
  def solve(file_path) do
    Aoc2023.Day01.Main.solve(file_path, &line_to_digits/1)
  end

  def line_to_digits(line) do
    line
    |> String.to_charlist()
    |> Enum.filter(&(&1 in ?0..?9))
    |> Enum.map(&(&1 - ?0))
  end
end
