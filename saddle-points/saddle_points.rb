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
    res = []
    rows.each_with_index do |row, i|
      columns.each_with_index { |col, j| res << [i, j] if row[j] == row.max && col[i] == col.min }
    end
    res
  end
end
