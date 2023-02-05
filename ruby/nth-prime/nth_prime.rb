module Prime
  def self.nth(input, n = 0, i = 0)
    raise ArgumentError if input.zero?

    loop do
      return n if prime?(n) && i > input

      i += 1 if prime?(n)
      n += 1
    end
  end

  def self.prime?(num)
    [*2..Math.sqrt(num)].none? { |n| (num % n).zero? }
  end
end
