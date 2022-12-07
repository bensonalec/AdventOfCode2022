defmodule DaySix do
  findIndex = fn
    maxNum, content ->
      Enum.find_index(Enum.chunk_every(content, maxNum, 1, :discard), fn x ->
        length(Enum.uniq(x)) == maxNum
      end) + maxNum
  end

  content = "sample.txt" |> File.read!() |> String.graphemes()
  IO.inspect(findIndex.(4, content))
  IO.inspect(findIndex.(14, content))
end
