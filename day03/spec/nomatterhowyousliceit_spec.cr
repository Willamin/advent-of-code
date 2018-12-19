require "spec"
require "../src/nomatterhowyousliceit"

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

INPUT = <<-INPUT
    #1 @ 1,3: 4x4
    #2 @ 3,1: 4x4
    #3 @ 5,5: 2x2
    INPUT

describe NoMatterHowYouSliceIt do
  it "works for part1" do
    assert NoMatterHowYouSliceIt.part1(INPUT) == "4"
  end

  it "works for part2" do
    assert NoMatterHowYouSliceIt.part2(INPUT) == "3"
  end
end
