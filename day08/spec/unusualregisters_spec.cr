require "spec"
require "../src/unusualregisters"

EXAMPLE = <<-EX
b inc 5 if a > 1
a inc 1 if b < 5
c dec -10 if a >= 1
c inc -20 if c == 10
EX

describe UnusualRegisters do
  it "works for part1" do
    UnusualRegisters.part1(EXAMPLE).should eq("1")
  end

  it "works for part2" do
    UnusualRegisters.part2("input").should eq("output")
  end
end
