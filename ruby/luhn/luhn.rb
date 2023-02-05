module Luhn
  def self.valid?(digits)
    # check for invalid input
    return false if digits.length < 2 || digits.match?(/[^0-9 ]/) || digits.start_with?(' ')

    # remove spaces and reverse digits
    digits = digits.delete(' ').reverse

    # double and subtract 9 from every second digit, starting from the rightmost digit
    digits = digits.chars.map.with_index do |char, index|
      if index.even?
        char.to_i
      else
        char = char.to_i * 2
        char -= 9 if char > 9
        char
      end
    end

    # check if the sum is divisible by 10
    (digits.sum % 10).zero?
  end
end
