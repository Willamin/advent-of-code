module UnusualRegisters
  extend self

  def part1(input : String) : String
    parser = Parser.new
    input.each_line do |line|
      parser << line
    end
    parser.max.to_s
  end

  def part2(input : String) : String
    parser = Parser.new
    input.each_line do |line|
      parser << line
    end
    parser.max_ever.to_s
  end
end

class Parser
  @registers = Hash(String, Int32).new(0)
  @max_ever = Int32::MIN

  def condition?(register, operation, operand)
    operand = operand.to_i
    {% begin %}
      case operation
      {% for operand in ["==", "!=", "<", ">", "<=", ">="] %}
      when {{operand}}
        @registers[register] {{operand.id}} operand
      {% end %}
      else
        raise "Missing conditional definition: #{operation}"
      end
    {% end %}
  end

  def <<(line : String)
    statement, conditional = line.split("if")
    register, operation, operand = statement.split
    if_register, if_operation, if_operand = conditional.split

    if condition?(if_register, if_operation, if_operand)
      {% begin %}
        case operation
        {% for operation, operator in {"inc": "+", "dec": "-"} %}
        when {{operation.stringify}}
          @registers[register] = @registers[register] {{operator.id}} operand.to_i
        {% end %}
        else
          raise "Missing operation definition: #{if_operation}"
        end
      {% end %}
    end

    if @registers[register] > @max_ever
      @max_ever = @registers[register]
    end
  end

  def inspect(io)
    io << "Parser\n"
    @registers.each do |k, v|
      io << "#{k.inspect} => #{v.inspect}"
      io << "\n"
    end
  end

  def max
    @registers.values.max
  end

  def max_ever
    @max_ever
  end
end
