require "spec"
require "../src/memoryreallocation"

describe MemoryReallocation do
  it "works for part1" do
    MemoryReallocation.part1("0 2 7 0").should eq("5")
  end

  it "works for part2" do
    MemoryReallocation.part2("2 4 1 2").should eq("4")
  end
end
