class Phrase
  attr_reader :word_count
  def initialize(input)
    @word_count = input.downcase.scan(/\b\w*'?\w+/).tally
  end
end
