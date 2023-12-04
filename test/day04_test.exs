defmodule Day04Test do
  use ExUnit.Case

  test "part 1 example" do
    assert Aoc2023.Day04.Part1.solve("lib/day04/example.txt") == 13
  end

  test "part 1 input" do
    assert Aoc2023.Day04.Part1.solve("lib/day04/input.txt") == 19855
  end

  test "part 2 example" do
    assert Aoc2023.Day04.Part2.solve("lib/day04/example.txt") == 30
  end

  test "part 2 input" do
    assert Aoc2023.Day04.Part2.solve("lib/day04/input.txt") == 10_378_710
  end
end
