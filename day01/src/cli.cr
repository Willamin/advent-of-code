require "./*"

ARGF.gets_to_end.try do |input|
  print "part 1: "
  puts Reversecaptcha.part1(input)

  print "part 2: "
  puts Reversecaptcha.part2(input)
end
