class Nucleotide
  NUCLE_TYPE = %w[A T C G]
  attr_reader :histogram

  def initialize(histogram)
    @histogram = histogram
  end

  def count(type)
    @histogram.fetch(type)
  end

  def self.from_dna(string)
    self.new(self.dna_string_to_histogram(string))
  end

  def self.dna_string_to_histogram(string)
    raise ArgumentError unless (string.split('').uniq - NUCLE_TYPE).empty?
    NUCLE_TYPE.each_with_object({}) { |key, hash| hash[key] = string.count(key) }
  end
end
