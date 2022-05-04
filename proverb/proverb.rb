class Proverb
  attr_reader :words, :qualifier

  def initialize(*word, qualifier: nil)
    @words = *word
    @qualifier = qualifier
  end

  def to_s
    @words
      .each_cons(2)
      .map { |lacked_item, jeopardised_item| "For want of a #{lacked_item} the #{jeopardised_item} was lost." }
      .push("And all for the want of a #{qualifier} #{@words.first}.".squeeze(' '))
      .join("\n")

    # doc = <<~EOS
    # EOS
    # @words.each_cons(2) { |a, b| doc << "For want of a #{a} the #{b} was lost.\n" }

    # last_word = @qualifier ? @qualifier + ' ' + @words[0] : @words[0]
    # doc << "And all for the want of a #{last_word}."
  end
end
