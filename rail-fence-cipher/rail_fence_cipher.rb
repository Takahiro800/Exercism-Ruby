class RailFenceCipher
  def self.encode(string, num)
    return string if num == 1
    ans = ''
    chars = string.split('')
    k = 0

    for i in 0...num
      # line = chars.select.with_index { |char, index| index % (2 * num) == i || index % (2 * num) == 2 * num - 1 - i }
      case i
      when 0
        line = chars.select.with_index { |char, index| index % (2 * (num - 1)) == 0 }
      when num - 1
        line = chars.select.with_index { |char, index| index % (num - 1) == 0 && (index / (num - 1) % 2 == 1) }
      else
        line =
          chars.select.with_index do |char, index|
            index % (2 * (num - 1)) == i || index % (2 * (num - 1)) == 2 * (num - 1) - i
          end
      end
      ans += line.join
    end
    return ans
  end

  def self.decode(string, num)
    return string if num == 1
    chars = string.split('')
    hash = {}
    lines = {}
    for i in 0...num
      case i
      when 0
        line = chars.select.with_index { |char, index| index % (2 * (num - 1)) == 0 }
      when num - 1
        line = chars.select.with_index { |char, index| index % (num - 1) == 0 && (index / (num - 1) % 2 == 1) }
      else
        line =
          chars.select.with_index do |char, index|
            index % (2 * (num - 1)) == i || index % (2 * (num - 1)) == 2 * (num - 1) - i
          end
      end
      hash[i] = line.length
      lines[i] = string.slice!(0...line.length)
    end
    p hash
    p lines
    ans = ''
    max_size = hash.values.max
    while ans.length < chars.join.length
      for i in 0..num - 1
        return ans if lines[i].nil?
        return ans if lines[i].empty?
        ans += lines[i].slice!(0)
      end

      for i in 1...num - 1
        i = num - 1 - i

        return ans if lines[i].nil?
        return ans if lines[i].empty?

        # ans += lines[i].shift
        ans += lines[i].slice!(0)
      end
    end
    ans
  end
end

p RailFenceCipher.decode('ESXIEECSR', 4)
