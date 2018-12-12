module Maze
  extend self

  def part1(input : String) : String
    steps = [] of Int32
    input.each_line do |line|
      if i = line.to_i?
        steps << i
      end
    end
    maze_mover(Maze.new(steps)).to_s
  end

  def part2(input : String) : String
    steps = [] of Int32
    input.each_line do |line|
      if i = line.to_i?
        steps << i
      end
    end
    maze_mover(Maze2.new(steps)).to_s
  end

  def maze_mover(maze, print? = false)
    maze
    moves = 0
    loop do |i|
      moves = i
      if maze.can_move?
        maze.print_maze if print?
        maze.move
      else
        break
      end
    end
    moves
  end

  class Maze
    @steps : Array(Int32)
    @current_position : Int32 = 0

    def initialize(@steps)
    end

    def can_move?
      begin
        @steps[@steps[@current_position]]
        true
      rescue
        false
      end
    end

    def move
      offset = @steps[@current_position]
      @steps[@current_position] += 1
      @current_position += offset
    end

    def print_maze
      @steps.each_with_index do |trampoline, index|
        if index == @current_position
          print "(#{trampoline})"
        else
          print " #{trampoline} "
        end
      end
      puts
    end
  end

  class Maze2 < Maze
    def move
      offset = @steps[@current_position]

      if offset >= 3
        @steps[@current_position] -= 1
      else
        @steps[@current_position] += 1
      end

      @current_position += offset
    end
  end
end
