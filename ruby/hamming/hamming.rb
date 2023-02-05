module Hamming
  def self.compute(strand1, strand2)
    raise ArgumentError if strand1.size != strand2.size

    (0..strand1.length).count { |i| strand1[i] != strand2[i] }
  end
end
