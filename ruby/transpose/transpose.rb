module Transpose
  def self.transpose(input)
    return '' if input.empty?

    arr = []
    input.lines do |line|
      arr << line.chomp.split(//)
    end
    p arr.map(&:join).join("\n")
  end
end
