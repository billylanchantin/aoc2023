defmodule Aoc2023.Day01.Main do
  @moduledoc """
  You try to ask why they can't just use a weather machine ("not powerful enough") and where
  they're even sending you ("the sky") and why your map looks mostly blank ("you sure ask a lot of
  questions") and hang on did you just say the sky ("of course, where do you think snow comes
  from") when you realize that the Elves are already loading you into a trebuchet ("please hold
  still, we need to strap you in").

  As they're making the final adjustments, they discover that their calibration document (your
  puzzle input) has been amended by a very young Elf who was apparently just excited to show off
  her art skills. Consequently, the Elves are having trouble reading the values on the document.

  The newly-improved calibration document consists of lines of text; each line originally contained
  a specific calibration value that the Elves now need to recover. On each line, the calibration
  value can be found by combining the first digit and the last digit (in that order) to form a
  single two-digit number.

  For example:

      1abc2
      pqr3stu8vwx
      a1b2c3d4e5f
      treb7uchet

  In this example, the calibration values of these four lines are 12, 38, 15, and 77. Adding these
  together produces 142.

  Consider your entire calibration document. What is the sum of all of the calibration values?
  """
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
