module HexEd
  extend self

  def part1(input : String) : String
    steps = input.split(",").map do |i|
      Direction.parse(i)
    end



    "0"
  end

  def part2(input : String) : String
    "not implemented yet"
  end
end

enum Direction
  NE
  N
  NW
  SW
  S
  SE
end

