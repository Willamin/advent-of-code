require "spec"
require "../src/reversecaptcha"

describe Reversecaptcha do
  it "works for the part1 1st example" do
    Reversecaptcha.part1("1122")
                  .should eq(3)
  end

  it "works for the part1 2nd example" do
    Reversecaptcha.part1("1111")
                  .should eq(4)
  end

  it "works for the part1 3rd example" do
    Reversecaptcha.part1("1234")
                  .should eq(0)
  end

  it "works for the part1 4th example" do
    Reversecaptcha.part1("91212129")
                  .should eq(9)
  end

  it "works for the part2 1st example" do
    Reversecaptcha.part2("1212")
                  .should eq(6)
  end

  it "works for the part2 2nd example" do
    Reversecaptcha.part2("1221")
                  .should eq(0)
  end

  it "works for the part2 3rd example" do
    Reversecaptcha.part2("123425")
                  .should eq(4)
  end

  it "works for the part2 4th example" do
    Reversecaptcha.part2("123123")
                  .should eq(12)
  end

  it "works for the part2 5th example" do
    Reversecaptcha.part2("12131415")
                  .should eq(4)
  end
end
