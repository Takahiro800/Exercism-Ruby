class ArmstrongNumbers
  def self.include?(num)
    num.digits.sum { |n| n**num.digits.size } == num
  end
end
