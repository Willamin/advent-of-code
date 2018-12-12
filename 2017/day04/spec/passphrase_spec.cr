require "spec"
require "../src/passphrase"

describe Passphrase do
  it "follows the examples" do
    Passphrase.valid?("aa bb cc dd ee").should eq(true)
    Passphrase.valid?("aa bb cc dd aa").should eq(false)
    Passphrase.valid?("aa bb cc dd aaa").should eq(true)
  end

  it "works for part2" do
    Passphrase.valid?("abcde fghij", :anagram).should eq(true)
  end
end
