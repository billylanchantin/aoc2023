defmodule Aoc2023.Day01.Main do
  def solve(file_path, line_to_digits) when is_function(line_to_digits, 1) do
    file_path
    |> File.read!()
    |> solve_string(line_to_digits)
  end

  def solve_string(string, line_to_digits) when is_binary(string) do
    string
    |> String.split("\n")
    |> Stream.map(line_to_digits)
    |> Stream.map(&digits_to_calibration/1)
    |> Enum.sum()
  end

  def digits_to_calibration(digits) do
    Integer.undigits([List.first(digits), List.last(digits)])
  end
end
