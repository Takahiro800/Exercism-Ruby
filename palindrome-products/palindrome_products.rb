class Palindromes
  attr_reader :range, :max, :min

  def initialize(max_factor:, min_factor: 1)
    @range = (min_factor..max_factor).to_a
  end

  def generate
    # list = @range.repeated_combination(2).map { |a, b| a * b }
    palindromes =
      @range
        .repeated_combination(2)
        .map { |a, b| a * b }
        .select { |n| n.to_s.split('') == n.to_s.split('').reverse }
        .uniq
    @max = palindromes.max
    @min = palindromes.min
  end

  def largest
    factors = @range.repeated_combination(2).select { |a, b| a * b == @max }
    PalindromesNumber.new(@max, factors)
  end

  def smallest
    factors = @range.repeated_combination(2).select { |a, b| a * b == @min }
    PalindromesNumber.new(@min, factors)
  end
end

class PalindromesNumber
  attr_reader :value, :factors

  def initialize(value, factors)
    @value = value
    @factors = factors
  end
end
