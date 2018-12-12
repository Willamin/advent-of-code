module Reversecaptcha
  extend self

  def build_looping_list(input : String) : Array(Int32)
    list_of_ints = [] of Int32
    input.each_char do |c|
      if c.to_i?
        list_of_ints << c.to_i
      end
    end

    list_of_ints << list_of_ints.first
  end

  def sum_loop(list : Array(Int32))
    total = 0
    (list.size - 1).times do |index|
      current_int = list[index]
      target_int = yield list, index

      if current_int == target_int
        total += current_int
      end
    end
    total
  end

  def part1(input : String) : Int32
    list_of_ints = build_looping_list(input)
    sum_loop(list_of_ints) do |list, index|
      list[index + 1]
    end
  end

  def part2(input : String) : Int32
    list_of_ints = build_looping_list(input)
    sum_loop(list_of_ints) do |list, index|
      size = list.size - 1
      halfway = size / 2
      position = index + halfway

      list[position % size]
    end
  end
end
