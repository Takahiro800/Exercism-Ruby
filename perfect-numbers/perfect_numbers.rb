class PerfectNumber
  def self.classify(n)
    raise RuntimeError if n < 1

    aliquot_sum = (1..n - 1).select { |i| n % i == 0 }.sum

    if aliquot_sum == n
      return 'perfect'
    elsif aliquot_sum < n
      return 'deficient'
    else
      return 'abundant'
    end
  end
end
