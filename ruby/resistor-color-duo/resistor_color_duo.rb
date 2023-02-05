module ResistorColorDuo
  COLORS = %w[Black Brown Red Orange Yellow Green Blue Violet Grey White].freeze
  def self.value(colors)
    colors.first(2).map { |color| COLORS.index(color.capitalize) }.join.to_i
  end
end
