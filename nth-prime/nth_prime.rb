class Prime
  PRIME_NUMBERS = [2]

  def self.nth(n)
    raise ArgumentError if n < 1

    tmp = PRIME_NUMBERS.max + 1

    while PRIME_NUMBERS.length < n
      PRIME_NUMBERS << tmp if PRIME_NUMBERS.none? { |prime| tmp % prime == 0 }
      tmp += 1
    end

    return PRIME_NUMBERS[n - 1]
  end
end
