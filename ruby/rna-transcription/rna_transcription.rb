module Complement
  DNA = 'CATG'.freeze
  RNA = 'GUAC'.freeze
  def self.of_dna(strand)
    strand.tr(DNA, RNA)
  end
end

