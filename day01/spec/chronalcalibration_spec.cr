require "spec"
require "../src/chronalcalibration"

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

describe ChronalCalibration do
  it "works for part1" do
    assert ChronalCalibration.part1("+1 +1 +1") == "3"
    assert ChronalCalibration.part1("+1 +1 -2") == "0"
    assert ChronalCalibration.part1("-1 -2 -3") == "-6"
  end

  it "works for part2" do
    assert ChronalCalibration.part2("+1 -1") == "0"
    assert ChronalCalibration.part2("+3 +3 +4 -2 -4") == "10"
    assert ChronalCalibration.part2("-6 +3 +8 +5 -6") == "5"
    assert ChronalCalibration.part2("+7 +7 -2 -7 -4") == "14"
  end
end
