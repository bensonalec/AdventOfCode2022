defmodule DayFive do
  runInstructionPartOne = fn
    ins, stack ->
      [_, num, from, to] = ins
      {from, ""} = Integer.parse(from)
      {to, ""} = Integer.parse(to)
      {num, ""} = Integer.parse(num)
      from = from - 1
      to = to - 1
      Enum.map(Enum.with_index(stack), fn
        {x, ind} when ind == from -> Enum.slice(x, num, 100)
        {x, ind} when ind == to -> Enum.reverse(Enum.slice(Enum.at(stack, from), 0, num)) ++ x
        {x, _} -> x
      end)
  end

  runInstructionPartTwo = fn
    ins, stack ->
      [_, num, from, to] = ins
      {from, ""} = Integer.parse(from)
      {to, ""} = Integer.parse(to)
      {num, ""} = Integer.parse(num)
      from = from - 1
      to = to - 1
      Enum.map(Enum.with_index(stack), fn
        {x, ind} when ind == from -> Enum.slice(x, num, 100)
        {x, ind} when ind == to -> Enum.slice(Enum.at(stack, from), 0, num) ++ x
        {x, _} -> x
      end)
  end

  content = File.read!("sample.txt")
  bins = Regex.scan(~r/\[(\w+)\]|    /, content)
  maxbin = Regex.run(~r/(\d+) \n\n/, content)
  {maxBin, ""} = Integer.parse(Enum.at(maxbin, 1))
  instructions = Regex.scan(~r/move (\d+) from (\d+) to (\d+)/, content)
  bins = Enum.chunk_every(bins, maxBin)
  initialStack =
    Enum.map(0..(maxBin - 1), fn n ->
      Enum.map(0..(length(bins) - 1), fn i -> Enum.at(Enum.at(Enum.at(bins, i), n), 1) end)
    end)
  initialStack = Enum.map(initialStack, fn x -> Enum.filter(x, &(!is_nil(&1))) end)
  IO.puts List.to_string(Enum.map(Enum.reduce(instructions, initialStack, runInstructionPartOne), fn x -> Enum.at(x, 0) end))
  IO.puts List.to_string(Enum.map(Enum.reduce(instructions, initialStack, runInstructionPartTwo), fn x -> Enum.at(x, 0) end))
end
