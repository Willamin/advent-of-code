require "./*"

ARGF.gets_to_end.try do |input|
  print "part 1: "
  puts KnotHash.part1(input)

  print "part 2: "
  puts KnotHash.part2(input)
end
