class Pangram
  def self.pangram?(sentence)
    (sentence.downcase.gsub(' ', '').split('').uniq & ('a'..'z').to_a).size == 26
  end
end
