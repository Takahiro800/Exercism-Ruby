class Scrabble
  SCORES = {
    'A' => 1,
    'E' => 1,
    'I' => 1,
    'O' => 1,
    'U' => 1,
    'L' => 1,
    'N' => 1,
    'R' => 1,
    'S' => 1,
    'T' => 1,
    'D' => 2,
    'G' => 2,
    'B' => 3,
    'C' => 3,
    'M' => 3,
    'P' => 3,
    'F' => 4,
    'H' => 4,
    'V' => 4,
    'W' => 4,
    'Y' => 4,
    'K' => 5,
    'J' => 8,
    'X' => 8,
    'Q' => 10,
    'Z' => 10
  }

  def initialize(letter)
    @letter = letter.nil? ? [] : letter.upcase.split('')
  end

  def score
    return 0 if @letter.nil?
    @letter.sum { |char| SCORES[char] || 0 }
  end

  def self.score(letter)
    new(letter).score
  end
end

# class Scrabble
    # P1 = [ 'A', 'E','I', 'O', 'U', 'L', 'N', 'R', 'S', 'T' ]
  # P2 = ['D', 'G'].freeze
  # P3 = ['B', 'C', 'M', 'P'].freeze
  # P4 = ['F', 'H', 'V', 'W', 'Y' ].freeze
  # P5 = ['K'].freeze
  # P8 = ['J', 'X'].freeze
  # P10 = ['Q', 'Z'].freeze

  # def initialize(letter)
  #   @letter = letter
  # end

  # def score
  #   return 0 if @letter.nil?
  #   @letter.upcase.split('').inject(0){ |sum, n| sum + self.calculate(n)}
  # end

  # def self.score(letter)
  #   return 0 if letter.nil?
  #   new(letter).score
  # end

  # protected
  # def calculate(char)
  #   if P1.include?(char)
  #     return 1
  #   elsif P2.include?(char)
  #     return 2
  #   elsif P3.include?(char)
  #     return 3
  #   elsif P4.include?(char)
  #     return 4
  #   elsif P5.include?(char)
  #     return 5
  #   elsif P8.include?(char)
  #     return 8
  #   elsif P10.include?(char)
  #     return 10
  #   else
  #     return 0
  #   end
  # end
# end