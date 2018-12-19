require "./*"

ARGF.gets_to_end.try do |input|
  print "part 1: "
  puts NoMatterHowYouSliceIt.part1(input)

  print "part 2: "
  puts NoMatterHowYouSliceIt.part2(input)
end
