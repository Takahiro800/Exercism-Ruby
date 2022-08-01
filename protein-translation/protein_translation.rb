class InvalidCodonError < StandardError
end

class Translation
  CODON_TO_PROTEIN = {
    'AUG' => 'Methionine',
    'UUU' => 'Phenylalanine',
    'UUC' => 'Phenylalanine',
    'UUA' => 'Leucine',
    'UUG' => 'Leucine',
    'UCU' => 'Serine',
    'UCC' => 'Serine',
    'UCA' => 'Serine',
    'UCG' => 'Serine',
    'UAU' => 'Tyrosine',
    'UAC' => 'Tyrosine',
    'UGU' => 'Cysteine',
    'UGC' => 'Cysteine',
    'UGG' => 'Tryptophan',
    'UAA' => 'STOP',
    'UAG' => 'STOP',
    'UGA' => 'STOP',
  }

  def self.of_codon(codon)
    raise false unless CODON_TO_PROTEIN.key?(codon)

    CODON_TO_PROTEIN[codon]
  end

  def self.of_rna(strand)
    codons = strand.scan(/.{1,#{3}}/)
    raise InvalidCodonError unless codons.reject { |codon| CODON_TO_PROTEIN.key?(codon) }.empty?
    if codons.include?('UAA')
      i = codons.index('UAA')
      codons = codons[...i]
    end
    codons.map { |codon| self.of_codon(codon) }
  end
end

strand = 'CARROT'
strand = 'UGGUGUUAUUAAUGGUUU'
p Translation.of_rna(strand)
