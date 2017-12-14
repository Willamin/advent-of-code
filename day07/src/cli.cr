require "./*"

ARGF.gets_to_end.try do |input|
  # print "part 1: "
  # puts RecursiveCircus.part1(input)

  # print "part 2: "
  # puts RecursiveCircus.part2(input)

  p RecursiveCircus.buildroot(input)
end
