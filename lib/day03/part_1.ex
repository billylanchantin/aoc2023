defmodule Aoc2023.Day03.Part1 do
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
