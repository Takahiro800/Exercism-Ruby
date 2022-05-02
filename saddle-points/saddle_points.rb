class Matrix
  attr_reader :nums
  def initialize(nums)
    @nums = nums.split("\n").map { |i| i.split(' ').map!(&:to_i) }
  end

  def rows
    @nums
  end

  def columns
    @nums.transpose
  end

  def saddle_points
    ans = []
    (0...rows.size).each do |i|
      (0...columns.size).each { |j| ans << [i, j] if @nums[i][j] == rows[i].max && @nums[i][j] == columns[j].min }
    end
    return ans
  end
end
