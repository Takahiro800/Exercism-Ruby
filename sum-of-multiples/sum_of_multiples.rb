class SumOfMultiples
  attr_reader :list_num

  def initialize(*list)
    @list = list
  end

  def to(up_to_num)
    (1...up_to_num).select { |num| @list.any? { |list_num| num % list_num == 0 } }.flatten.uniq.sum
  end
end
