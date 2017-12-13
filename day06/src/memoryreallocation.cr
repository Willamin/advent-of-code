macro not(thing)
  !{{thing}}
end

module MemoryReallocation
  extend self

  def part1(input : String) : String
    banks = input.split.map &.to_i
    m = MemoryReallocation::Memory.new(banks)
    m.redistribute_loop
    m.steps_taken.to_s
  end

  def part2(input : String) : String
    banks = input.split.map &.to_i
    m = MemoryReallocation::Memory.new(banks)
    m.redistribute_loop
    m.loop_size.to_s
  end

  class Memory
    @banks : Array(Int32)
    @states : Array(Array(Int32))

    def steps_taken
      @states.size
    end

    def initialize(@banks)
      @states = [] of Array(Int32)
    end

    def redistribute_loop
      @states << @banks.dup

      pointer = @banks.index(@banks.max).not_nil!
      bag = @banks[pointer]
      @banks[pointer] = 0
      while bag > 0
        pointer += 1
        pointer %= @banks.size
        @banks[pointer] += 1
        bag -= 1
      end

      while !@states.includes?(@banks)
        redistribute_loop
      end
    end

    def loop_size
      steps_taken - @states.index(@banks).not_nil!
    end
  end
end
