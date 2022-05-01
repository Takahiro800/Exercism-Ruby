class PhoneNumber
  def self.clean(number)
    num = number.gsub('-', ' ').gsub('.', ' ')
    num =
      num.split.join.delete(
        '(' \
          ')',
      )

    return self.delete_country_code(num)
  end

  private

  def self.delete_country_code(num)
    if num.length == 11 && num[0] == '1'
      num = num[1..]
    elsif num.length == 12 && num[0..1] == '+1'
      num = num[2..]
    end

    return nil if num.length != 10
    return nil unless (2..9).include?(num[0].to_i)
    return nil unless (2..9).include?(num[3].to_i)
    return num
  end
end
