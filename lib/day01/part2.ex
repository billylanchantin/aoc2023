defmodule Aoc2023.Day01.Part2 do
  def solve(file_path) do
    Aoc2023.Day01.Main.solve(file_path, &line_to_digits/1)
  end

  @digits %{
    ~r/zero/ => 0,
    ~r/one/ => 1,
    ~r/two/ => 2,
    ~r/three/ => 3,
    ~r/four/ => 4,
    ~r/five/ => 5,
    ~r/six/ => 6,
    ~r/seven/ => 7,
    ~r/eight/ => 8,
    ~r/nine/ => 9,
    ~r/0/ => 0,
    ~r/1/ => 1,
    ~r/2/ => 2,
    ~r/3/ => 3,
    ~r/4/ => 4,
    ~r/5/ => 5,
    ~r/6/ => 6,
    ~r/7/ => 7,
    ~r/8/ => 8,
    ~r/9/ => 9
  }
  def line_to_digits(line) do
    @digits
    |> Enum.flat_map(fn {regex, value} ->
      regex
      |> Regex.scan(line, return: :index)
      |> Enum.map(fn [{start, _}] -> {start, value} end)
    end)
    |> Enum.sort()
    |> Enum.map(fn {_, value} -> value end)
  end
end
