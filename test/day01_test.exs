defmodule Day01Test do
  use ExUnit.Case

  test "part 1 example" do
    assert Aoc2023.Day01.Part1.solve("lib/day01/example_1.txt") == 142
  end

  test "part 1 input" do
    assert Aoc2023.Day01.Part1.solve("lib/day01/input.txt") == 55538
  end

  test "part 2 example" do
    assert Aoc2023.Day01.Part2.solve("lib/day01/example_2.txt") == 281
  end

  test "part 2 input" do
    assert Aoc2023.Day01.Part2.solve("lib/day01/input.txt") == 54875
  end
end
