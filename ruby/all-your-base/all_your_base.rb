module BaseConverter
  def self.convert(input_base, digits, output_base)
    raise ArgumentError if [output_base, input_base].any? do |base|
                             base <= 1
                           end || digits.any?(&:negative?) || input_base == 2 && digits.any? do |digit|
                                                                ![0, 1].include?(digit)
                                                              end

    digits = to_decimal(digits, input_base) if input_base != 10

    if output_base == 16
      to_hex(digits)
    elsif output_base == 2
      to_binary(digits)
    elsif output_base == 3
      to_trinary(digits)
    else
      digits
    end
  end

  def self.to_hex(digits)
    digits = digits.join.to_i
    digits.divmod(16)
  end

  def self.to_trinary(digits)
    result = []
    digits = digits.join.to_i
    until digits.zero?
      quotient, reminder = digits.divmod(3)
      result << reminder
      digits = quotient
    end
    result.reverse
  end

  def self.to_binary(digits)
    result = []
    digits = digits.join.to_i
    return [0] if digits.zero?

    if digits.digits.size > 1
      until digits.zero?
        digits /= 2
        result << digits % 2
      end
    else
      until digits.zero?
        result << digits % 2
        digits /= 2
      end
    end
    result
  end

  def self.to_decimal(digits, base)
    result = []
    digits.reverse.map.with_index do |digit, index|
      result << (digit * (base**index))
    end
    result.sum.to_s.split(//).map(&:to_i)
  end
end
