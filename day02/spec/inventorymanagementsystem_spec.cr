require "spec"
require "../src/inventorymanagementsystem"

include Spec::Methods

macro assert(expr)
  unless {{expr}}
  {% if expr.name.stringify == "==" %}
      fail(String.build do |s|
        s << "Left side:  "
        s << {{expr.receiver}}.inspect
        s << "\n"
        s << "Right side: "
        s << {{expr.args.first.stringify}}
      end)
    {% end %}
  end
end

describe InventoryManagementSystem do
  it "works for part1" do
    input = <<-INPUT
    abcdef
    bababc
    abbcde
    abcccd
    aabcdd
    abcdee
    ababab
    INPUT
    assert InventoryManagementSystem.part1(input) == "12"
  end

  it "works for part2" do
    input = <<-INPUT
    abcde
    fghij
    klmno
    pqrst
    fguij
    axcye
    wvxyz
    INPUT
    assert InventoryManagementSystem.part2(input) == "fgij"
  end
end
