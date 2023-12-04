defmodule Day03Test do
  use ExUnit.Case

  test "part 1 example" do
    assert Aoc2023.Day03.Part1.solve("lib/day03/example.txt") == 4361
  end

  test "part 1 input" do
    assert Aoc2023.Day03.Part1.solve("lib/day03/input.txt") == 532_428
  end

  test "part 2 example" do
    assert Aoc2023.Day03.Part2.solve("lib/day03/example.txt") == 467_835
  end

  test "part 2 input" do
    assert Aoc2023.Day03.Part2.solve("lib/day03/input.txt") == 84_051_670
  end
end
