class Series
  def slices(series, result = [])
    raise ArgumentError if series > @digits.size || series < MIN_SERIES || @digits.empty?

    @digits.size.times do |i|
      break if (i + series) > @digits.size

      result << @digits[i..(i + series - 1)]
    end
    result
  end

  def initialize(input)
    @digits = input
  end

  MIN_SERIES = 1
end
