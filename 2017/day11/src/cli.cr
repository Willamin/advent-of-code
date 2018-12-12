require "./*"

ARGF.gets_to_end.try do |input|
  print "part 1: "
  puts HexEd.part1(input)

  print "part 2: "
  puts HexEd.part2(input)
end
