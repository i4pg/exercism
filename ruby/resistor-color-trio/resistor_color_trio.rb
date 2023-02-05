class ResistorColorTrio
  attr_reader :colors

  COLORS = %w[black brown red orange yellow green blue violet grey white].freeze

  def initialize(colors)
    @colors = colors
  end

  def label
    raise ArgumentError unless colors.all? { |color| COLORS.include?(color) }

    "Resistor value: #{conversion(values + zeros)}"
  end

  private

  def values
    colors
      .first(2)
      .map { |color| COLORS.index(color) }
      .join
  end

  def zeros
    '0' * COLORS.index(colors.last)
  end

  def conversion(total)
    if total.scan(/0/).length >= 3 # If there's more than 3 zeros
      "#{total.gsub('000', '')} kiloohms" # replace each 3 zeroes with an empty string
    else
      "#{total} ohms"
    end
  end
end
