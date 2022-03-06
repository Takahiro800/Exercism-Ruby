module Isogram
  def self.isogram?(input)
    # words_arr = input.gsub('-', '').downcase.split.map { |word| word.split("").group_by(&:itself).transform_values(&:size)}
    # !words_arr.find {|hash| hash.values.inject(:+) != hash.size}
    letters = input.downcase.chars - [' ', '-']
    letters == letters.uniq
  end
end