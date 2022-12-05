parseLine = fn
  x -> Enum.slice(Regex.run(~r/SOME_REGEX/, x), 1, 100)
end

Enum.map(String.split(File.read!("sample.txt"), "\n"), parseLine)
