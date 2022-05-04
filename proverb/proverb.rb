class Proverb
  attr_reader :words, :qualifier

  def initialize(*word, qualifier: nil)
    @words = *word
    @qualifier = qualifier
  end

  def to_s
    doc = <<~EOS
    EOS
    @words.each_cons(2) { |a, b| doc << "For want of a #{a} the #{b} was lost.\n" }

    last_word = @qualifier ? @qualifier + ' ' + @words[0] : @words[0]
    doc << "And all for the want of a #{last_word}."
  end
end
