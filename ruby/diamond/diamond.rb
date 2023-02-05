class Diamond
  def self.make_diamond(letter)
    result = []
    spaces = letter.ord - 'A'.ord
    ('A'..letter).each do |current_letter|
      if current_letter == 'A'
        result << ' ' * spaces + current_letter + ' ' * spaces
      else
        middle_spaces = (current_letter.ord - 'A'.ord) * 2 - 1
        result << ' ' * spaces + current_letter + ' ' * middle_spaces + current_letter + ' ' * spaces
      end
      spaces -= 1
    end
    result += result[0...-1].reverse
    result.join("\n") + "\n"
  end
end
