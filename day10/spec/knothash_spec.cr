require "spec"
require "../src/knothash"

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

describe KnotHash do
  it "rotates successfully 1 time" do
    h = Hasher.new(5)
    h.select(3)
    h.reverse_selection
    h.shift(3)

    assert h.pointer == 3
    assert h.circle.to_a == [2, 1, 0, 3, 4]
  end

  it "works for part1" do
    assert KnotHash.part1("3, 4, 1, 5", 5) == "12"
  end

  it "works for part2" do
    assert KnotHash.part2("") == "a2582a3a0e66e6e86e3812dcb672a272"
    # assert KnotHash.part2("AoC 2017") == "33efeb34ea91902bb2f59c9920caa6cd"
    # assert KnotHash.part2("1,2,3") == "3efbe78a8d82f29979031a4aa0b16a9d"
    # assert KnotHash.part2("1,2,4") == "63960835bcdc130f0b66d7ff4f6a5a8e"
  end
end
