require "./*"

ARGF.gets_to_end.try do |input|
  print "part 1: "
  puts ChronalCalibration.part1(input)

  print "part 2: "
  puts ChronalCalibration.part2(input)
end
