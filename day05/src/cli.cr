require "./*"

ARGF.gets_to_end.try do |input|
  print "part 1: "
  puts Maze.part1(input)

  print "part 2: "
  puts Maze.part2(input)
end
