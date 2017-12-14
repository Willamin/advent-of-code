module RecursiveCircus
  extend self

  def part1(input : String) : String
    root = buildroot(input)
    root.name
  end

  def part2(input : String) : String
    root = buildroot(input)
    find_problem(root).to_s
  end

  def buildroot(input : String)
    nodes = Hash(String, Node).new
    input.split("\n").each do |line|
      begin
        name = line.split[0]
      rescue
        next
      end
      weight = line.split[1]
                   .gsub("(", "")
                   .gsub(")", "")
                   .to_i

      if line.includes?("->")
        proposal = line.split("->")[1].split(",").map(&.strip).to_set
      else
        proposal = Set(String).new
      end

      nodes[name] = Node.new(name, weight, proposal)
    end

    nodes.each do |name, node|
      node.proposed_children.each do |c|
        nodes[c].parent = node
        node << nodes[c]
      end
    end

    nodes.each do |name, node|
      if !node.parent.nil?
        nodes.delete(name)
      end
    end

    raise "Non-one root error" if nodes.size != 1
    root = nodes.first_value
  end

  def find_problem(root : Node) : Int32
    unless root.children_balanced?
      a = root.uniq_children.to_a.sort_by(&.total_weight)
      return a.last.weight - (a.last.total_weight - a.first.total_weight)
    end

    root.children.each do |child|
      find_problem(child)
    end
    0
  end
end

class Node
  @name : String
  @weight : Int32
  @children : Set(Node)
  @proposed_children : Set(String)
  @parent : Node?

  def inspect(io, indent = 0)
    indent.times { io << " " }
    io << "#{@name} (#{@weight})"
    io << " => #{total_weight}" if @children.size > 0
    io << "\n"
    @children.each do |child|
      io << child.inspect(io, indent + 2)
    end
  end

  def initialize(@name, @weight, @proposed_children)
    @children = Set(Node).new
    @parent = nil
  end

  def <<(child)
    @children << child
  end

  getter name, weight, children, proposed_children
  property parent

  def uniq_children
    @children.to_a.uniq(&.total_weight)
  end

  def children_balanced?
    uniq_children.size == 1
  end

  def total_weight
    @weight + @children.reduce(0) { |a, c| c.total_weight + a }
  end
end
