class SumOfMultiples
  def initialize(*multiples)
    @multiples = multiples
  end

  def to(num)
    (1...num).select do |n|
      @multiples.any? do |multiple|
        n.modulo(multiple).zero?
      end
    end.sum
  end
end
