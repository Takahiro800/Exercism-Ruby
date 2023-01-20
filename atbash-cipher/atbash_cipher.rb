class Atbash
  A_CODE = 97
  Z_CODE = 122
  ALPHABET_CODES = A_CODE..Z_CODE

  def self.encode(plaintext)
    ary = plaintext.downcase.gsub(' ','').gsub(',', '').gsub('.', '').unpack("U*")
    change = ary.map{ |code| translate(code) }
    change.pack("U*").scan(/.{1,#{5}}/).join(" ")
  end

  def self.decode(ciphertext)
    ciphertext.unpack("U*").map { |code| translate(code)}.pack("U*").gsub(' ', '')
  end

  private

  def self.translate(code)
    return code  unless ALPHABET_CODES.include?(code)

    A_CODE + Z_CODE - code
  end
end
