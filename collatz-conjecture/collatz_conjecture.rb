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
