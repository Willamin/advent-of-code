require "./*"

ARGF.gets_to_end.try do |input|
  print "part 1: "
  puts MemoryReallocation.part1(input)

  print "part 2: "
  puts MemoryReallocation.part2(input)
end
