require "./circle"

module KnotHash
  extend self

  def part1(input : String, list_size : Int32 = 256) : String
    inputs = input.split(",").map(&.strip)
    hasher = Hasher.new(list_size)
    # p hasher
    inputs.each do |i|
      i = i.to_i
      hasher.select(i)
      hasher.reverse_selection
      hasher.shift(i)
      hasher.increment_skip_size

      # p hasher
    end
    (hasher.circle[0] * hasher.circle[1]).to_s
  end

  def part2(input : String, list_size : Int32 = 256) : String
    inputs = input.strip.each_char.map(&.ord).to_a
    standard_suffix = [17, 31, 73, 47, 23]
    inputs += standard_suffix

    hasher = Hasher.new(list_size)
    64.times do
      inputs.each do |i|
        i = i.to_i
        hasher.select(i)
        hasher.reverse_selection
        hasher.shift(i)
        hasher.increment_skip_size
      end
    end

    block_xors = [] of Int32
    16.times do |i|
      block = hasher.block(i)
      block_xors << block.reduce(0) { |acc, i| acc ^ i }
    end

    block_xors.map { |x| sprintf("%02s", x.to_s(16)) }.join("")
  end
end

class Hasher
  @circle : Circle(Int32)
  @selection : Range(Int32, Int32)
  @pointer = 0
  @skip_size = 0

  getter circle, pointer, selection

  def initialize(size)
    @circle = Circle(Int32).new (0..(size - 1)).to_a
    @selection = 0..0
  end

  def inspect(io)
    io << @circle.inspect
    io << " (#{@pointer})"
    io << " (#{@selection})"
    io << " (#{@skip_size})"
    io << "\n"
  end

  def select(amount)
    @selection = (@pointer)..(@pointer + amount - 1)
    # puts "selecting #{@selection}"
  end

  def reverse_selection
    @circle[@selection] = @circle[@selection].reverse
    # puts "reversing selection"
  end

  def shift(amount)
    @pointer += amount + @skip_size
    @pointer %= @circle.size
    # puts "shifting pointer #{amount} to #{@pointer}"
  end

  def increment_skip_size
    @skip_size += 1
  end

  def block(n)
    raise "Block out of bounds" if n < 0 || n > @circle.size / 16
    @circle[(0 + n * 16)...(16 + n * 16)]
  end
end
