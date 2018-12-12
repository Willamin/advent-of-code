require "./*"

ARGF.gets_to_end.try do |input|
  print "part 1: "
  puts InventoryManagementSystem.part1(input)

  print "part 2: "
  puts InventoryManagementSystem.part2(input)
end
