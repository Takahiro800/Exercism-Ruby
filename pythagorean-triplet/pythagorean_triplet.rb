class Triplet
  def initialize(a, b, c)
    @edge = [a, b, c]
  end

  def sum
    @edge.sum
  end

  def product
    @edge.inject(:*)
  end

  def pythagorean?
    a, b, c = @edge.sort
    a**2 + b**2 == c**2
  end

  def self.where(max_factor:, min_factor: 1, sum: nil)
    products =
      (min_factor..max_factor)
        .to_a
        .combination(3)
        .each_with_object([]) do |combination, triplets|
          triplet = Triplet.new(*combination)
          triplets << triplet if triplet.pythagorean? && (sum.nil? || triplet.sum == sum)
        end
  end
end
