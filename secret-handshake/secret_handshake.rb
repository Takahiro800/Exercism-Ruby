class SecretHandshake
  TYPES = ['wink', 'double blink', 'close your eyes', 'jump'].freeze

  attr_reader :number

  def initialize(num)
    @number = num
  end

  def commands
    return [] unless number.instance_of?(Integer)

    ans = TYPES.select.with_index{ |_, index| bit_on?(index) }
    bit_on?(4) ans.reverse : ans
  end

  private

  def bit_on?(bit)
    number & (2 ** bit) != 0
  end
end