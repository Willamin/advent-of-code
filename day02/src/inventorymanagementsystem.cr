require "levenshtein"

module InventoryManagementSystem
  extend self

  def part1(input : String) : String
    doubles = 0
    triples = 0
    input.split.each do |line|
      letter_set = Hash(Char, Int32).new(0)
      line.chars.each do |char|
        letter_set[char] += 1
      end
      doubles += 1 if letter_set.any? { |k, v| v == 2 }
      triples += 1 if letter_set.any? { |k, v| v == 3 }
    end

    (doubles * triples).to_s
  end

  def part2(input : String) : String
    correct_box_pair : {String, String}? = nil

    input.split.each_combination(2) do |combo|
      a, b = combo
      if Levenshtein.distance(a, b) == 1
        correct_box_pair = {a, b}
        break
      end
    end

    correct_box_pair.try { |a, b| a.chars - (a.chars - b.chars) }.try(&.join) || "no common boxes"
  end
end
