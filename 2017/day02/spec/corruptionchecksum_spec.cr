require "spec"
require "../src/corruptionchecksum"


describe Corruptionchecksum do
  it "computes the first row diff in the example for part 1" do
    input = [5, 1, 9, 5]
    Corruptionchecksum.row_diff(input).should eq(8)
  end

  it "computes the second row diff in the example for part 1" do
    input = [7, 5, 3]
    Corruptionchecksum.row_diff(input).should eq(4)
  end

  it "computes the third row diff in the example for part 1" do
    input = [2, 4, 6, 8]
    Corruptionchecksum.row_diff(input).should eq(6)
  end

  it "works for part 1" do
    Corruptionchecksum.part1("5 1 9 5\n7 5 3\n2 4 6 8").should eq(18)
  end

  it "works for part 2" do
    Corruptionchecksum.part2("5 9 2 8\n9 4 7 3\n3 8 6 5").should eq(9)
  end
end
