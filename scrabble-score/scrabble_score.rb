class Scrabble
  attr_reader :letter

  P1 = [ 'A', 'E','I', 'O', 'U', 'L', 'N', 'R', 'S', 'T' ]
  P2 = ['D', 'G'].freeze
  P3 = ['B', 'C', 'M', 'P'].freeze
  P4 = ['F', 'H', 'V', 'W', 'Y' ].freeze
  P5 = ['K'].freeze
  P8 = ['J', 'X'].freeze
  P10 = ['Q', 'Z'].freeze

  def initialize(letter)
    @letter = letter
  end

  def score
    return 0 if @letter.nil?
    @letter.upcase.split('').inject(0){ |sum, n| sum + self.calculate(n)}
  end

  def self.score(letter)
    return 0 if letter.nil?
    new(letter).score
  end

  protected
  def calculate(char)
    if P1.include?(char)
      return 1
    elsif P2.include?(char)
      return 2
    elsif P3.include?(char)
      return 3
    elsif P4.include?(char)
      return 4
    elsif P5.include?(char)
      return 5
    elsif P8.include?(char)
      return 8
    elsif P10.include?(char)
      return 10
    else
      return 0
    end
  end
end