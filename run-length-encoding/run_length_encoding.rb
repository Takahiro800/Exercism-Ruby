class RunLengthEncoding
  def self.encode(str)
    str.gsub(/(.)\1+/) { |s| "#{s.length}#{s[0]}" }
  end

  def self.decode(str)
    str.gsub(/\d+./) { |s| s[-1] * s.to_i }
  end
end
