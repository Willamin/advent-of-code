module Spiralmemory
  extend self

  def part1(input : String)
    distance input.to_i
  end

  def part2(input : String)
    "not implemented yet"
  end

  def calculate(input : Int32)
    cycle = get_cycle(input)
  end

  def cycle(input : Int32)
    ring_width = 0
    (input - 1).downto(1) do |i|
      next if i.even?
      if Math.sqrt(i).round == Math.sqrt(i)
        ring_width = Math.sqrt(i)
        break
      end
    end

    ((ring_width + 3) / 2).to_i
  end

  def sqrt(cycle : Int32)
    (1..Int32::MAX).each
                   .select(&.odd?)
                   .first(cycle)
                   .to_a
                   .last
  end

  def perimeter(side : Int32)
    if side == 1
      1
    else
      side * side - 1
    end
  end

  def range(ring : Int32) : Range
    ring -= 1
    ring..(ring*2)
  end

  def distance(input)
    c = cycle(input)
    r = range(c)
    a = r.to_a.reverse + r.to_a[1..-2]

    position = -1
    (sqrt(c) ** 2).downto(input) do |i|
      position += 1
    end

    a[position % a.size]
  end
end

# alias S = Spiralmemory

# class ShellTable
#   def puts
#     puts self
#   end
# end

# ShellTable.new.tap do |table|
#   headers = ["spiral number", "ring", "square", "range", "distance"]

#   table.labels = headers
#   table.label_color = :yellow
#   table.border = false

#   table.rows = (1..25).map do |i|
#     c = S.cycle(i)
#     s = S.sqrt(c) ** 2
#     r = S.range(c)
#     d = S.distance(i)
#     ShellTable::Row.new [
#       sprintf("%#{headers[0].size}d", i),
#       sprintf("%#{headers[1].size}d", c),
#       sprintf("%#{headers[2].size}d", s),
#       sprintf("%#{headers[3].size}s", r),
#       sprintf("%#{headers[4].size}s", d),
#     ]
#   end
# end.puts

# puts S.range(S.cycle(300_000))
