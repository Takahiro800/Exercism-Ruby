class Allergies
  ALLERGIES = {
    1 => 'eggs',
    2 => 'peanuts',
    4 => 'shellfish',
    8 => 'strawberries',
    16 => 'tomatoes',
    32 => 'chocolate',
    64 => 'pollen',
    128 => 'cats',
  }.freeze

  attr_reader :binary

  def initialize(score)
    @score = score
    @binary = binarries(score)
  end

  def allergic_to?(item)
    list.include?(item)
  end

  def list
    binary.map { |key| ALLERGIES[key] }
  end

  private

  def binarries(score)
    arr = score.to_s(2).split('').reverse[0..7]
    arr.map.with_index { |i, index| i.to_i * 2**index }.select(&:positive?)
  end
end
