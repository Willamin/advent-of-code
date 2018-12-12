require "spec"
require "../src/recursivecircus"

EXAMPLE = <<-EX
pbga (66)
xhth (57)
ebii (61)
havc (66)
ktlj (57)
fwft (72) -> ktlj, cntj, xhth
qoyq (66)
padx (45) -> pbga, havc, qoyq
tknk (41) -> ugml, padx, fwft
jptl (61)
ugml (68) -> gyxo, ebii, jptl
gyxo (61)
cntj (57)
EX

describe RecursiveCircus do
  it "works for part1" do
    RecursiveCircus.part1(EXAMPLE).should eq("tknk")
  end

  it "works for part2" do
    RecursiveCircus.part2(EXAMPLE).should eq("60")
  end
end
