class Triangle
  attr_reader :side_length

  def initialize(side_length)
    @side_length = side_length.sort
  end

  def triangle?
    side_length.all? { |v| v > 0 } && side_length[2] <= side_length[0] + side_length[1]
  end

  def equilateral?
    return false unless triangle?
    side_length.uniq.length == 1
  end

  def isosceles?
    return false unless triangle?
    side_length.uniq.length <= 2
  end

  def scalene?
    return false unless triangle?
    side_length.uniq.length == 3
  end
end
