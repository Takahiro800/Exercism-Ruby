module Luhn
  def self.valid?(number)
    # 半角数字または空白のみ
    return false unless number.gsub(' ', '').match?(/^[0-9]*$/)
    nums = number.gsub(' ', '').split('')
    # 長さが１以下の時は無効
    return false if nums.size < 2
    # 長さを揃えるために、奇数の場合は先頭に0を追加　
    nums.unshift("0") if nums.size.odd?
    sums = nums.map.with_index {|num, i| i.odd? ? num.to_i : multi(num.to_i) }.sum
    sums % 10 == 0
  end

  private
  def self.multi(n)
    (0..4).include?(n.to_i) ? n*2 : n*2-9
  end

end