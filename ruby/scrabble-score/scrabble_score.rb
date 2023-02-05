class Scrabble
  def initialize(input)
    @input = input
  end

  def score
    points = 0
    @input.chars do |char|
      case char.downcase!
      when %w[a e i o u l n r s t]
        points += 1
      when %w[d g]
        points += 2
      when %w[b c m p]
        points += 3
      when %w[f h v w y]
        points += 4
      when 'k'
        points += 5
      when %w[j x]
        points += 8
      when %w[q z]
        points += 10
      end
    end
    points
  end
end
