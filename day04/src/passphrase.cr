module Passphrase
  extend self

  def valid?(passphrase : String, flag : Symbol = :nil) : Bool
    original_words = passphrase.split
    filtered_word_list = original_words
    filtered_word_list = filtered_word_list.uniq

    case flag
    when :anagram
      if anagram_exists?(filtered_word_list)
        return false
      end
    end

    filtered_word_list == original_words
  end

  def anagram_exists?(words : Array(String)) : Bool
    pair_everything(words) do |first, second|
      if set_of_letters(first) == set_of_letters(second)
        return true
      end
    end
    false
  end

  def pair_everything(list)
    list.each do |first|
      list.each do |second|
        next if first == second
        yield first, second
      end
    end
  end

  def set_of_letters(string)
    string.each_char.to_set
  end

  def part1(list_of_words : String)
    list_of_words.each_line.reduce(0) do |acc, word|
      acc += 1 if valid?(word)
      acc
    end
  end

  def part2(list_of_words : String)
    list_of_words.each_line.reduce(0) do |acc, word|
      acc += 1 if valid?(word, :anagram)
      acc
    end
  end
end
