class Anagram
  def initialize(word)
    @word = word
  end

  def match(pattern)
    pattern.filter do |w|
      @word.downcase != w.downcase &&
        w.downcase.split(//).sort ==
          @word.downcase.split(//).sort
    end
  end
end

