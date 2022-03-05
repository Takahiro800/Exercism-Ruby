class Matrix
  attr_reader :rows, :columns

  def initialize(matrix_num)
    @rows = matrix_num.split("\n").map { |row| row.split.map(&:to_i) }
    @columns = @rows.transpose
  end
end

matrix = Matrix.new("1 2 3\n4 5 6\n7 8 9\n 8 7 6")
p matrix.rows