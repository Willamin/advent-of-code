require "./*"

ARGF.gets_to_end.try do |input|
  print "part 1: "
  puts Passphrase.part1(input)

  print "part 2: "
  puts Passphrase.part2(input)
end
