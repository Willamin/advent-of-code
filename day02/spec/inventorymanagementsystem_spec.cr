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
    assert InventoryManagementSystem.part1("input") == "output"
  end

  it "works for part2" do
    assert InventoryManagementSystem.part2("input") == "output"
  end
end
