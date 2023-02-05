module CollatzConjecture
  def self.steps(n, step = 0)
    raise ArgumentError if n <= 0
    return step if n == 1

    n.even? ? n /= 2 : n = n * 3 + 1
    steps(n, step += 1)
  end
end
