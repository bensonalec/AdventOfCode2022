defmodule DaySix do
  content = File.read!("sample.txt")
  content = String.graphemes(content)

  determineSignal = fn
    content, maxNum ->
      Enum.filter(Enum.map(Enum.with_index(content), fn {x, ind} ->
        current = x
        toLoop = 0..(maxNum - 1)
        toCheck = Enum.map(toLoop, fn x -> Enum.at(content, ind + x) end)

        if length(Enum.uniq(toCheck)) == maxNum do
          ind + 1 + maxNum - 1
        else
          nil
        end
      end), &(!is_nil(&1)))
  end

  [head | _] = determineSignal.(content, 4)
  IO.inspect(head)
  [head | _] = determineSignal.(content, 14)
  IO.inspect(head)

end
