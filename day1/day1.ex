defmodule DayOne do
  # Part 1
  getCalForElf = fn
    x -> Enum.sum(Enum.map(String.split(x, "\n"), &String.to_integer/1))
  end

  summedValues = Enum.map(String.split(File.read!("sample.txt"), "\n\n"), getCalForElf)
  IO.puts(Enum.max(summedValues))

  # Part 2
  maxOne = Enum.max(summedValues)
  summedValues = List.delete(summedValues, maxOne)
  maxTwo = Enum.max(summedValues)
  summedValues = List.delete(summedValues, maxTwo)
  maxThree = Enum.max(summedValues)
  List.delete(summedValues, maxThree)
  IO.puts(maxOne + maxTwo + maxThree)
end
