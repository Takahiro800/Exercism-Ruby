class Grains
  def self.square(num)
    raise ArgumentError if num < 1 || num > 64
    return 2**(num - 1)
  end

  def self.total(squares = 64)
    return 2**squares - 1
  end
end
