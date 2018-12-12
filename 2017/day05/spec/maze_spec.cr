require "spec"
require "../src/maze"

describe Maze do
  it "works for part1" do
    Maze.part1("0\n3\n0\n1\n-3").should eq("5")
  end

  it "works for part2" do
    Maze.part2("0\n3\n0\n1\n-3").should eq("10")
  end
end
