require "string_scanner"
require "json"

class MyParser
  getter data = Array(String?).new
  @scanner : StringScanner

  def initialize(@scanner); end

  def special_case(special : Symbol)
    case special
    when :spaces then /\s*/
    when :integer then /\d+/
    else //
    end
  end

  def ignore(special : Symbol)
    ignore(special_case(special))
  end

  def get_it(special : Symbol)
    get_it(special_case(special))
  end

  def ignore(s : String)
    ignore(/#{s}/)
  end

  def get_it(s : String)
    get_it(/#{s}/)
  end

  def ignore(regex : Regex)
    @scanner.scan(regex)
  end

  def get_it(regex : Regex)
    data << @scanner.scan(regex)
  end
end

module NoMatterHowYouSliceIt
  extend self

  FABRIC = Fabric.new

  def parse_square(input : String) : Square
      p = MyParser.new(StringScanner.new(input))
      p.ignore :spaces
      p.ignore "#"
      p.get_it :integer
      p.ignore :spaces
      p.ignore "@"
      p.ignore :spaces
      p.get_it :integer
      p.ignore ","
      p.get_it :integer
      p.ignore ":"
      p.ignore :spaces
      p.get_it :integer
      p.ignore "x"
      p.get_it :integer

      id, x, y, w, h = p.data

      Square.new(
        id.not_nil!, 
        x.not_nil!.to_i, 
        y.not_nil!.to_i,
        w.not_nil!.to_i, 
        h.not_nil!.to_i
      )
  end

  def build_fabric(input : String)
    input.lines.each do |line|
      FABRIC.claim(parse_square(line))
    end
  end

  def part1(input : String) : String
    build_fabric(input) if FABRIC.square_ids.size == 0
    FABRIC.overlapping_cells.size.to_s || "invalid"
  end

  def part2(input : String) : String
    build_fabric(input) if FABRIC.square_ids.size == 0
    o = FABRIC.not_overlapping_square_ids
    raise "#{o.size} non-overlapping squares. :(" if o.size != 1
    o.first
  end

  record Square, id : String, x : Int32, y : Int32, w : Int32, h : Int32

  class Fabric
    getter sheet
    getter square_ids
    getter overlapping_square_ids
    getter overlapping_inches

    def initialize
      @sheet = Hash(String, Set(String)).new { Set(String).new }
      @square_ids = Set(String).new
      @overlapping_square_ids = Set(String).new
      @overlapping_inches = Set(String).new
    end

    def claim(s : Square)
      @square_ids << s.id
      s.w.times do |x|
        s.h.times do |y|
          point = "#{x + s.x},#{y + s.y}"
          set = @sheet[point]
          set << s.id
          @sheet[point] = set
          if set.size > 1
            (set - @overlapping_square_ids).each do |id|
              @overlapping_square_ids << id
            end
            @overlapping_inches << point
          end
        end
      end
    end

    def overlapping_cells
      @overlapping_inches
    end

    def not_overlapping_square_ids
      return (@square_ids - @overlapping_square_ids)
    end
  end
end
