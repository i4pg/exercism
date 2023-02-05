module PerfectNumber
  Perfect = ->(sum) { sum == @num }
  Abundant = ->(sum) { sum > @num }
  Deficient = ->(sum) { sum < @num }

  def self.classify(num)
    raise RuntimeError unless num.positive?

    @num = num
    categories
  end

  def self.categories
    case aliquot.sum
    when Perfect then 'perfect'
    when Abundant then 'abundant'
    when Deficient then 'deficient'
    end
  end

  def self.aliquot
    (1..@num.div(2)).select { |n| @num.modulo(n).zero? }
  end
end
