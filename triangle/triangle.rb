class Triangle
  attr_reader :side_length

  def initialize(side_length)
    @side_length = side_length.sort
  end

  def equilateral?
    triangle? && side_length.uniq.length == 1
  end

  def isosceles?
    triangle? && side_length.uniq.length <= 2
  end

  def scalene?
    triangle? && side_length.uniq.length == 3
  end

  private

  def triangle?
    side_length.all?(&:positive?) && side_length[2] <= side_length[0] + side_length[1]
  end
end
