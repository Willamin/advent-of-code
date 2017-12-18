class Circle(T)
  @list : Array(T)

  def initialize(@list)
  end

  def [](x : Int32)
    @list[x % @list.size]
  end

  def []=(x : Int32, y : T)
    @list[x % @list.size] = y
  end

  def [](r : Range(Int32, Int32))
    output = [] of T
    r.each do |i|
      output << self[i]
    end
    output
  end

  def []=(r : Range(Int32, Int32), y : Array(T))
    raise "Mismatched size" if r.size != y.size
    Hash.zip(r.to_a, y).each do |index, value|
      self[index] = value
    end
  end

  def inspect(io)
    io << @list.inspect
  end

  def to_a
    @list
  end

  def size
    @list.size
  end
end
