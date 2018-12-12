module StreamProcessing
  extend self

  def part1(input : String) : String
    Parser.new(input).parse.total_score.to_s
  end

  def part2(input : String) : String
    Parser.new(input).parse.garbage_count.to_s
  end
end

class Parser
  GROUP_START   = "{"
  GROUP_END     = "}"
  GARBAGE_START = "<"
  GARBAGE_END   = ">"
  CANCEL        = "!"

  @total_score = 0
  @indentation = 0
  @garbage_count = 0
  @inside_garbage = false
  @ignore_next_character = false

  getter total_score, garbage_count

  def initialize(@input : String)
  end

  def parse
    @input.each_char do |c|
      debug("character: #{c}")

      if @ignore_next_character
        debug("  ignoring this character")
        @ignore_next_character = false
        next
      end

      token = c.to_s

      if token == CANCEL
        debug("  cancelling next token")
        @ignore_next_character = true
        next
      end

      if token == GARBAGE_END
        debug("  ending garbage")
        @inside_garbage = false
        next
      end

      if @inside_garbage
        debug("  inside garbage, next")
        @garbage_count += 1
        next
      end

      if token == GARBAGE_START
        debug("  beginning garbage")
        @inside_garbage = true
        next
      end

      if token == GROUP_START
        @indentation += 1
        debug("  beginning new group. this is group level: #{@indentation}")
        next
      end

      if token == GROUP_END
        @total_score += @indentation
        @indentation -= 1
        debug("  ending group. total score so far: #{@total_score}")
        next
      end
    end

    self
  end

  def debug(string)
    # puts string
  end
end

StreamProcessing.part1("{{<!>},{<!>},{<!>},{<a>}}")
