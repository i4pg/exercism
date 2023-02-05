class Nucleotide
  def self.from_dna(sequence)
    raise ArgumentError unless sequence =~ /\A[ACGT]*\z/
    Nucleotide.new(sequence)
  end
  def initialize(sequence) = @sequence = sequence.split(//)
  def count(nucleotide) = @sequence.count(nucleotide)
  def histogram = { 'A' => 0, 'T' => 0, 'C' => 0, 'G' => 0 }.merge(@sequence.tally)
end
