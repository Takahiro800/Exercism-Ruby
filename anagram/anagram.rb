class Anagram
  attr_reader :word

  def initialize(word)
    @word = word
  end

  def match(list)
    list.select { |w| @word.downcase != w.downcase && return_hash(@word) == return_hash(w) }
  end

  def return_hash(word)
    word_arr = word.downcase.chars.map
    word_arr.map { |char| [char, word_arr.count(char)] }.to_h
  end
end
