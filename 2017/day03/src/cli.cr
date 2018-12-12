require "./spiralmemory"

ARGF.gets_to_end.try do |input|
  print "part 1: "
  puts Spiralmemory.part1(input)

  print "part 2: "
  puts Spiralmemory.part2(input)
end
