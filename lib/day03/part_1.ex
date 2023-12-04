defmodule Aoc2023.Day03.Part1 do
  @moduledoc """
  --- Day 3: Gear Ratios ---

  You and the Elf eventually reach a gondola lift station; he says the gondola lift will take you
  up to the water source, but this is as far as he can bring you. You go inside.

  It doesn't take long to find the gondolas, but there seems to be a problem: they're not moving.

  "Aaah!"

  You turn around to see a slightly-greasy Elf with a wrench and a look of surprise. "Sorry, I
  wasn't expecting anyone! The gondola lift isn't working right now; it'll still be a while before
  I can fix it." You offer to help.

  The engineer explains that an engine part seems to be missing from the engine, but nobody can
  figure out which one. If you can add up all the part numbers in the engine schematic, it should
  be easy to work out which part is missing.

  The engine schematic (your puzzle input) consists of a visual representation of the engine. There
  are lots of numbers and symbols you don't really understand, but apparently any number adjacent
  to a symbol, even diagonally, is a "part number" and should be included in your sum. (Periods (.)
  do not count as a symbol.)

  Here is an example engine schematic:

      467..114..
      ...*......
      ..35..633.
      ......#...
      617*......
      .....+.58.
      ..592.....
      ......755.
      ...$.*....
      .664.598..

  In this schematic, two numbers are not part numbers because they are not adjacent to a symbol:
  114 (top right) and 58 (middle right). Every other number is adjacent to a symbol and so is a
  part number; their sum is 4361.

  Of course, the actual engine schematic is much larger. What is the sum of all of the part numbers
  in the engine schematic?
  """

  def solve(file_path), do: file_path |> File.read!() |> solve_contents()

  def solve_contents(contents) do
    parts = find_parts(contents)
    parts |> Map.values() |> List.flatten() |> Enum.sum()
  end

  def find_parts(contents) do
    lines = String.split(contents, "\n")

    chars =
      for {line, i} <- lines |> Enum.with_index(),
          {char, j} <- line |> String.to_charlist() |> Enum.with_index(),
          into: %{},
          do: {{i, j}, char}

    syms = for {{i, j}, c} <- chars, c not in ?0..?9 and c != ?., into: %{}, do: {{i, j, c}, []}

    # This only works because each number happens to touch at most one symbol.
    for {l, i} <- Enum.with_index(lines),
        [{s, n}] <- Regex.scan(~r/\d+/, l, return: :index),
        r <- (i - 1)..(i + 1),
        c <- (s - 1)..(s + n),
        key = {r, c, chars[{r, c}]},
        Map.has_key?(syms, key),
        reduce: syms,
        do: (acc -> Map.update!(acc, key, &[to_int(l, s, n) | &1]))
  end

  def to_int(l, s, n) do
    l |> String.slice(s, n) |> String.to_charlist() |> Enum.map(&(&1 - ?0)) |> Integer.undigits()
  end
end
