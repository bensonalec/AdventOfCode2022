defmodule DayFour do
  # Part One
  determineTotalOverlap = fn
    [x, y, i, j] when i <= x and x <= j and i <= y and y <= j -> 1
    [x, y, i, j] when x <= i and i <= y and x <= j and j <= y -> 1
    [_, _, _, _] -> 0
  end

  # Part Two
  determineAnyOverlap = fn
    [x, y, i, j] when (i <= x and x <= j) or (i <= y and y <= j) -> 1
    [x, y, i, j] when (x <= i and i <= y) or (x <= j and j <= y) -> 1
    [_, _, _, _] -> 0
  end

  parseLine = fn
    x -> Enum.map(Enum.slice(Regex.run(~r/(\d+)-(\d+),(\d+)-(\d+)/, x), 1, 100), &Integer.parse/1)
  end

  IO.puts(
    Enum.sum(
      Enum.map(
        Enum.map(String.split(File.read!("sample.txt"), "\n"), parseLine),
        determineTotalOverlap
      )
    )
  )

  IO.puts(
    Enum.sum(
      Enum.map(
        Enum.map(String.split(File.read!("sample.txt"), "\n"), parseLine),
        determineAnyOverlap
      )
    )
  )
end
