class BaseConverter
  def self.convert(input_base, digits, output_base)
    raise ArgumentError if input_base <= 1
    raise ArgumentError if output_base <= 1
    raise ArgumentError unless digits.select { |digit| digit >= input_base }.empty?
    raise ArgumentError unless digits.select { |digit| digit < 0 }.empty?

    return [0] if digits == 0 || digits.empty?

    len = digits.length

    num = 0

    digits.each_with_index { |digit, index| num += digit * input_base**(len - index - 1) }

    return [0] if num == 0

    ans = []

    while num >= output_base
      ans.push(num % output_base)
      num = num / output_base
    end
    ans.push(num) if num > 0
    ans.reverse
  end
end
