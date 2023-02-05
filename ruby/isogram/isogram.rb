module Isogram
  def self.isogram?(input)
    letters = input.downcase.scan(/\w/)
    letters == letters.uniq
  end
end

