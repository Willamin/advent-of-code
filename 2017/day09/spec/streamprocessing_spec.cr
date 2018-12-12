require "spec"
require "../src/streamprocessing"

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

describe StreamProcessing do
  it "part1" do
    assert StreamProcessing.part1("{}") == "1"
    assert StreamProcessing.part1("{{{}}}") == "6"
    assert StreamProcessing.part1("{{},{}}") == "5"
    assert StreamProcessing.part1("{{{},{},{{}}}}") == "16"
    assert StreamProcessing.part1("{<a>,<a>,<a>,<a>}") == "1"
    assert StreamProcessing.part1("{{<ab>},{<ab>},{<ab>},{<ab>}}") == "9"
    assert StreamProcessing.part1("{{<a>},{<a>},{<a>},{<a>}}") == "9"
    assert StreamProcessing.part1("{{<!>},{<!>},{<!>},{<a>}}") == "3"
  end

  it "works for part2" do
    assert StreamProcessing.part2("<>") == "0"
    assert StreamProcessing.part2("<random characters>") == "17"
    assert StreamProcessing.part2("<<<<>") == "3"
    assert StreamProcessing.part2("<{!>}>") == "2"
    assert StreamProcessing.part2("<!!>") == "0"
    assert StreamProcessing.part2("<!!!>>") == "0"
    assert StreamProcessing.part2("<{o\"i!a,<{i<a>") == "10"
  end
end
