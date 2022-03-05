module Hamming
  def self.compute(dna_1, dna_2)
    raise ArgumentError if dna_1.length != dna_2.length

    # count = 0
    # (0...dna_1.length).each do |i|
    #   count += 1 if dna_1[i] != dna_2[i]
    # end
    # return count
    0.upto(dna_1.length).count { |i| dna_1[i] != dna_2[i] }
  end
end
