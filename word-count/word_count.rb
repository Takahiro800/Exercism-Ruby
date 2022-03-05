class Phrase
  attr_reader :word

  def initialize(words)
    @words = words.downcase.scan(/\b[\w']+\b/)
  end

  def word_count
    @words.map { |word| [word, @words.count(word)] }.to_h
  end
end