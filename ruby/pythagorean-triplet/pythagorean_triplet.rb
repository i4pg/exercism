class Triplet
  def initialize(*triplet)
    @triplet = triplet
  end

  def sum
    @triplet.sum
  end

  def product
    @triplet.inject(:*)
  end

  def pythagorean?
    @triplet[0]**2 + @triplet[1]**2 == @triplet[2]**2
  end

  def self.where(max_factor:, min_factor: 1, sum: nil)
    [*(min_factor..max_factor)]
      .combination(3)
      .select { |triplet| sum.nil? || triplet.sum == sum }
      .map { |triplet| new(*triplet) }
      .select(&:pythagorean?)
  end
end
