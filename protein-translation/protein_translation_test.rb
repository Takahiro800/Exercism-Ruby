require 'minitest/autorun'
require_relative 'protein_translation'

class TranslationTest < Minitest::Test
  def test_AUG_translates_to_methionine # rubocop:disable Naming/MethodName
    assert_equal 'Methionine', Translation.of_codon('AUG')
  end

  def test_identifies_phenylalanine_codons
    assert_equal 'Phenylalanine', Translation.of_codon('UUU')
    assert_equal 'Phenylalanine', Translation.of_codon('UUC')
  end

  def test_identifies_leucine_codons
    %w[UUA UUG].each { |codon| assert_equal 'Leucine', Translation.of_codon(codon) }
  end

  def test_identifies_serine_codons
    %w[UCU UCC UCA UCG].each { |codon| assert_equal 'Serine', Translation.of_codon(codon) }
  end

  def test_identifies_tyrosine_codons
    %w[UAU UAC].each { |codon| assert_equal 'Tyrosine', Translation.of_codon(codon) }
  end

  def test_identifies_cysteine_codons
    %w[UGU UGC].each { |codon| assert_equal 'Cysteine', Translation.of_codon(codon) }
  end

  def test_identifies_tryptophan_codons
    assert_equal 'Tryptophan', Translation.of_codon('UGG')
  end

  def test_identifies_stop_codons
    %w[UAA UAG UGA].each { |codon| assert_equal 'STOP', Translation.of_codon(codon) }
  end

  def test_translates_rna_strand_into_correct_protein
    strand = 'AUGUUUUGG'
    expected = %w[Methionine Phenylalanine Tryptophan]
    assert_equal expected, Translation.of_rna(strand)
  end

  def test_stops_translation_if_stop_codon_present
    strand = 'AUGUUUUAA'
    expected = %w[Methionine Phenylalanine]
    assert_equal expected, Translation.of_rna(strand)
  end

  def test_stops_translation_of_longer_strand
    strand = 'UGGUGUUAUUAAUGGUUU'
    expected = %w[Tryptophan Cysteine Tyrosine]
    assert_equal expected, Translation.of_rna(strand)
  end

  def test_invalid_codons
    strand = 'CARROT'
    assert_raises(InvalidCodonError) { Translation.of_rna(strand) }
  end
end
