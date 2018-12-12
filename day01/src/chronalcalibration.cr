module ChronalCalibration
  extend self

  def part1(input : String) : String
    sum = 0
    input.split.each do |i|
      sum += Int32.new(i)
    end
    sum.to_s
  end

  def part2(input : String) : String
    sum = 0
    frequencies = Set(Int32).new([0])

    input.split.cycle do |i|
      sum += Int32.new(i)
      return sum.to_s if frequencies.includes?(sum)
      frequencies << sum
    end

    "not found"
  end
end
