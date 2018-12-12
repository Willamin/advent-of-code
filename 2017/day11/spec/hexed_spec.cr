require "spec"
require "../src/hexed"

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

describe HexEd do
  it "works for part1" do
    assert HexEd.part1("ne,ne,ne") == "3"
    assert HexEd.part1("ne,ne,sw,sw") == "0"
    assert HexEd.part1("ne,ne,s,s") == "2"
    assert HexEd.part1("se,sw,se,sw,sw") == "3"
  end

  it "works for part2" do
    # assert HexEd.part2("input") == "output"
  end
end
