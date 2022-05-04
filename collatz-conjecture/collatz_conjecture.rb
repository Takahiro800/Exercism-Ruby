class CollatzConjecture
  def self.steps(n, count: 0)
    raise ArgumentError if n < 1
    return steps_helper(n, count)
  end

  private

  def self.steps_helper(n, count)
    return count if n == 1
    n.odd? ? steps_helper(3 * n + 1, count + 1) : steps_helper(n / 2, count + 1)
  end
end

# class CollatzConjecture
#   def self.steps(num)
#     raise ArgumentError, num if num < 1
#     enum_for(:each, num).count
#   end
#   def self.each(num)
#     yield num = num.even? ? num / 2 : 3 * num + 1 until num == 1
#   end
# end
