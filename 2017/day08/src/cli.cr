require "./*"

ARGF.gets_to_end.try do |input|
  print "part 1: "
  puts UnusualRegisters.part1(input)

  print "part 2: "
  puts UnusualRegisters.part2(input)
end
