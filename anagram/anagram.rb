class Anagram
  attr_reader :source_word

  def initialize(source_word)
    @source_word = source_word.downcase
  end

  def match(list)
    list.select { |word| anagram?(word) }
    # list.select { |w| @word.downcase != w.downcase && return_hash(@word) == return_hash(w) }
  end

  # def return_hash(word)
  #   word_arr = word.downcase.chars.map
  #   word_arr.map { |char| [char, word_arr.count(char)] }.to_h
  # end
  private

  def anagram?(word)
    word = word.downcase
    @source_word != word && sort_chars(@source_word) == sort_chars(word)
  end

  def sort_chars(word)
    word.chars.sort
  end
end
