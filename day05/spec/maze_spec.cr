require "spec"
require "../src/maze"

describe Maze do
  it "works for part1" do
    Maze.part1("input").should eq("output")
  end

  it "works for part2" do
    Maze.part2("input").should eq("output")
  end
end
