require "./*"

ARGF.gets_to_end.try do |input|
  print "part 1: "
  puts Corruptionchecksum.part1(input)

  print "part 2: "
  puts Corruptionchecksum.part2(input)
end
