## Series
My initial solution was simple and easy for me to understand, but it was not as efficient or elegant as some of the community solutions. I found one solution in particular to be particularly impressive:

class Series
  def initialize(string)
    @string = string
  end

  def slices(n)
    raise ArgumentError if n > @string.length

    @string         # assuming n == 2 :
      .each_char    # %w(s t r i n g)
      .each_cons(n) # [%w(s t), %w(t r), %w(r i), %w(i n), %w(n g)]
      .map(&:join)  # %w(st tr ri in ng)
  end
end

This solution was impressive because it only uses built-in methods, has meaningful comments, and uses one error-raising condition instead of three (which was my solution). I also learned that the each_cons method is an Enumerable method, not an Array or String method. It calls the block with each successive overlapped n-tuple of elements.

Here's my basic solution using basic iterations over an array:

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

Overall, I found this exercise to be a great learning experience, and I hope that my solution and observations can help others who are working on this exercise.
