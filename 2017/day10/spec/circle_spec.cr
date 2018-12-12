require "spec"
require "../src/circle"

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

describe Circle do
  it "builds a circle" do
    c = Circle(String).new(["a", "b", "c", "d", "e"])
    assert c[0] == "a"
    assert c[7] == "c"

    assert c[0..2] == ["a", "b", "c"]
    assert c[7..9] == ["c", "d", "e"]

    assert c[8..11] == ["d", "e", "a", "b"]

    c[1] = "B"
    c[8] = "D"

    assert c[1] == "B"
    assert c[8] == "D"

    c[0..2] = ["A", "B", "C"]
    assert c[0..2] == ["A", "B", "C"]

    c[8..11] = ["D", "E", "A", "B"]
    assert c[8..11] == ["D", "E", "A", "B"]
  end
end
