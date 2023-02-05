require 'benchmark'
class Sieve4
  def initialize(n)
    @n = n
  end

  def primes
    return [] if @n < 2

    a = (2..@n).to_a

    a.each do |i|
      next if i.nil?

      return a.compact if i * i > @n

      ((2 * i - 2)..(@n - 2)).step(i).each { |j| a[j] = nil }
    end

    a.compact
  end
end

class Sieve3
  def initialize(max)
    @max = max
  end

  def primes
    nums = [nil, nil, *2..@max]
    (2..Math.sqrt(@max)).each do |i|
      (i**2..@max).step(i) { |m| nums.delete(m) } if nums[i]
    end
    nums
  end
end

class Sieve2
  def initialize(max)
    @max = max
  end

  def primes
    nums = [nil, nil, *2..@max]
    (2..Math.sqrt(@max)).each do |i|
      (i**2..@max).step(i) { |m| nums[m] = nil } if nums[i]
    end
    nums.compact
  end
end

class Sieve
  attr_reader :max

  def initialize(number)
    @max = number
  end

  def primes
    return [] if max < 2

    range = [*2..max]
    range.each do |n|
      next if n.nil?

      multiply = n
      range.each do
        multiply += n
        break if multiply > max

        range[range.index(multiply)] = nil if range.include?(multiply)
      end
      range.compact!
    end
  end
end

Benchmark.bmbm do |x|
  x.report('mine') { Sieve.new(1_000).primes }
  x.report('first_solution') { Sieve2.new(1_000).primes }
end
