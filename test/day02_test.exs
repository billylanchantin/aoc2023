defmodule Day02Test do
  use ExUnit.Case

  @bag %{"red" => 12, "green" => 13, "blue" => 14}

  test "part 1 example" do
    assert Aoc2023.Day02.Part1.solve("lib/day02/example.txt", @bag) == 8
  end

  test "part 1 input" do
    assert Aoc2023.Day02.Part1.solve("lib/day02/input.txt", @bag) == 2727
  end

  test "part 2 example" do
    assert Aoc2023.Day02.Part2.solve("lib/day02/example.txt") == 2286
  end

  test "part 2 input" do
    assert Aoc2023.Day02.Part2.solve("lib/day02/input.txt") == 56580
  end
end
