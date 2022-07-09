class Prime
  # PRIME_NUMBERS = [2]
  MAX_NUMBER = 10**6

  def self.nth(n)
    raise ArgumentError if n < 1

    is_prime = Array.new(MAX_NUMBER, true)
    is_prime[0] = false
    is_prime[1] = false

    count = 0
    [*2..MAX_NUMBER].each do |i|
      next unless is_prime[i]

      count += 1
      return i if count == n

      ((2 * i)..MAX_NUMBER).step(i).each { |j| is_prime[j] = false }
    end

    prime[n]
  end
end
