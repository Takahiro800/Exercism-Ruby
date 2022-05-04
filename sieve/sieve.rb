class Sieve
  def initialize(n)
    @num = n
  end

  def primes
    (1..@num).to_a.select { |n| (1..n).count { |i| n % i == 0 } == 2 }
  end
end
