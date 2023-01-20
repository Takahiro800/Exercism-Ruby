class SecretHandshake
  attr_reader :bin

  def initialize(num)
    @bin = num
  end

  def commands
    return [] unless bin.instance_of?(Integer)

    secret = { 1 => 'wink', 2 => 'double blink', 4 => 'close your eyes', 8 => 'jump'  }
    ans = secret.keys.select{ |num| (bin & num).positive? }.map!{|key| secret[key]}

    (bin & 16).positive? ? ans.reverse : ans
  end
end