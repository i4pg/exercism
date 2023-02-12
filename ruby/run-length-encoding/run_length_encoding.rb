module RunLengthEncoding
  def self.encode(input)
    result = []
    counter = 1
    index = 2
    input.chars.inject do |acc, char|
      if index == input.length
        if acc == char
          counter += 1
          result << "#{counter unless counter == 1}#{acc}"
        else
          result << "#{counter unless counter == 1}#{acc}#{char}"
        end
      elsif acc == char
        counter += 1
      else
        result << "#{counter unless counter == 1}#{acc}"
        counter = 1
      end
      index += 1
      acc = char
    end
    result.join
  end

  def self.decode(input)
    input
      .scan(/(\d+)?(\w|\s)/)
      .map { |(t, c)| t = t.nil? ? [1, c] : [t.to_i, c] }
      .map { |(t, c)| c * t }
      .join
  end
end
