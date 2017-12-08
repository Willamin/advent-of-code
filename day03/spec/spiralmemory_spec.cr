require "spec"
require "../src/spiralmemory"

describe Spiralmemory do
  it "follows the examples" do
    Spiralmemory.distance(1).should eq(0)
  end

  it "follows the examples" do
    Spiralmemory.distance(2).should eq(1)
  end

  it "follows the examples" do
    Spiralmemory.distance(3).should eq(2)
  end

  it "follows the examples" do
    Spiralmemory.distance(4).should eq(1)
  end

  it "follows the examples" do
    Spiralmemory.distance(5).should eq(2)
  end

  it "follows the examples" do
    Spiralmemory.distance(6).should eq(1)
  end

  it "follows the examples" do
    Spiralmemory.distance(7).should eq(2)
  end

  it "follows the examples" do
    Spiralmemory.distance(8).should eq(1)
  end

  it "follows the examples" do
    Spiralmemory.distance(9).should eq(2)
  end

  it "follows the examples" do
    Spiralmemory.distance(10).should eq(3)
  end

  it "follows the examples" do
    Spiralmemory.distance(11).should eq(2)
  end

  it "follows the examples" do
    Spiralmemory.distance(12).should eq(3)
  end

  it "follows the examples" do
    Spiralmemory.distance(13).should eq(4)
  end

  it "follows the examples" do
    Spiralmemory.distance(14).should eq(3)
  end

  it "follows the examples" do
    Spiralmemory.distance(15).should eq(2)
  end

  it "follows the examples" do
    Spiralmemory.distance(16).should eq(3)
  end
end
