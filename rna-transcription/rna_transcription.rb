class Complement

  DNA = 'CATG'
  RNA = 'GUAC'

  def self.of_dna(nucleotides)
    nucleotides.tr(DNA, RNA)
  end

  # def self.of_dna(dna)
  #   dna.split("").map{ |dna| return_nucleotide(dna) }.join
  # end

  # def self.return_nucleotide(dna)
  #   return "" if dna.nil?
  #   case dna
  #     when 'G' then  return 'C'
  #     when 'C' then  return 'G'
  #     when 'T' then  return 'A'
  #     when 'A' then  return 'U'
  #   end
  # end
end