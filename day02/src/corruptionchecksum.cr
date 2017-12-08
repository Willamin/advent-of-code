module Corruptionchecksum
  extend self

  def row_diff(list : Array(Int32))
    if list.size == 0
      0
    else
      list.max - list.min
    end
  end

  def row_mod0(list : Array(Int32))
    list.each do |i|
      list.each do |j|
        if i % j == 0 && i / j != 1
          return i / j
        end
      end
    end
    0
  end

  def check(input : String)
    total = 0
    input.each_line do |line|
      list = [] of Int32

      line.split(/\s/) do |num|
        if i = num.to_i?
          list << i
        end
      end

      total += yield list
    end
    total
  end

  def part1(input : String)
    check(input) do |list|
      row_diff(list)
    end
  end

  def part2(input : String)
    check(input) do |list|
      row_mod0(list)
    end
  end
end
