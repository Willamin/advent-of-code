require "./*"

ARGF.gets_to_end.try do |input|
  print "part 1: "
  puts StreamProcessing.part1(input)

  print "part 2: "
  puts StreamProcessing.part2(input)
end
