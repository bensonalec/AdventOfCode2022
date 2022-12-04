#NOTE: I did not write this solution, just thought it was good and worth saving.
#Didn't seem to be an "interesting" enough problem to warrant rewriting it in a new language
#Credit to Reddit User RewrittenCodeA

#Part 1
IO.puts Enum.sum(
  for <<a, _, b>> <- String.split(File.read!("sample.txt"), "\n", trim: true),
      do: 3 * rem(b - a + 2, 3) + 1 + rem(b + 2, 3)
)

#Part 2
IO.puts Enum.sum(
  for <<a, _, b>> <- String.split(File.read!("sample.txt"), "\n", trim: true),
      do: rem(b + a + 2, 3) + 1 + 3 * rem(b + 2, 3)
)
