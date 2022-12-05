defmodule DayThree do
  # Part One
  getPriority = fn
    <<x>> when x > 95 -> x - 96
    <<x>> -> x - 64 + 26
  end

  getInCommonItems = fn
    x ->
      x = String.graphemes(x)

      val =
        MapSet.to_list(
          MapSet.intersection(
            MapSet.new(Enum.slice(x, 0, div(length(x), 2))),
            MapSet.new(Enum.slice(x, div(length(x), 2), 100))
          )
        )

      Enum.sum(Enum.map(val, getPriority))
  end

  IO.puts(Enum.sum(Enum.map(String.split(File.read!("sample.txt"), "\n"), getInCommonItems)))

  # Part Two
  getInCommonItems = fn
    x ->
      pOne = String.graphemes(Enum.at(x, 0))
      pTwo = String.graphemes(Enum.at(x, 1))
      pThree = String.graphemes(Enum.at(x, 2))

      val =
        MapSet.to_list(
          MapSet.intersection(
            MapSet.intersection(MapSet.new(pOne), MapSet.new(pTwo)),
            MapSet.new(pThree)
          )
        )

      Enum.sum(Enum.map(val, getPriority))
  end

  IO.puts(
    Enum.sum(
      Enum.map(Enum.chunk_every(String.split(File.read!("sample.txt"), "\n"), 3), getInCommonItems)
    )
  )
end
