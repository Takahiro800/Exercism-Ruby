class RailFenceCipher
  def self.encode(string, num)
    zigzag(num, string.length).zip(string.chars).sort.map { |a| a[1] }.join
  end

  def self.decode(string, num)
    zigzag(num, string.length).sort.zip(string.chars).sort_by { |a| a[0][1] }.map { |a| a[1] }.join
  end

  def self.zigzag(num, size)
    pattern = (0..num - 1).to_a + (1..num - 2).to_a.reverse
    pattern.cycle.first(size).zip(0..size)
  end

  private_class_method :zigzag
end
