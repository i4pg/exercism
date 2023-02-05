module BaseConverter
  def self.convert(input_base, digits, output_base)
    raise ArgumentError if input_base == 2 && digits.any? { |digit| ![0, 1].include?(digit) } ||
                           [output_base, input_base].any? { |base| base <= 1 } ||
                           digits.any?(&:negative?)

    to_base(to_decimal(digits, input_base), output_base)
  end

  def self.to_decimal(digits, base)
    digits.reverse.each_with_index.sum { |digit, index| digit * base**index }
  end

  def self.to_base(number, base)
    digits = []
    while number.positive?
      digits << number % base
      number /= base
    end
    digits.empty? ? [0] : digits.reverse
  end
end
