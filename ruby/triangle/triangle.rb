class Triangle
  def initialize(sides)
    @sides = sides
  end

  def triangle?
    @sides.all?(&:positive?) &&
      @sides.permutation(3).all? { |(a, b, c)| a <= b + c }
  end

  def equilateral?
    triangle? && @sides.permutation(2).all? { |a, b| a == b }
  end

  def isosceles?
    triangle? && @sides.permutation(2).any? { |a, b| a == b }
  end

  def scalene?
    triangle? && @sides.permutation(2).none? { |a, b| a == b }
  end
end
