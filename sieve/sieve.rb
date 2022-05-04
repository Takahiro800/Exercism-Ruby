class Sieve
  def initialize(n)
    @num = n
  end

  def primes
    prime = []
    (1..@num).to_a.each do |num|
      divisor = 0
      (1..num).each { |i| divisor += 1 if num % i == 0 }
      prime << num if divisor == 2
    end
    return prime
  end
end
