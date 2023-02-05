class Proverb
  attr_reader :words, :qualifier

  def initialize(*args, qualifier: args[0])
    @words = *args
    @qualifier = qualifier
  end

  def to_s
    "#{words_compnation.join}#{last_line}"
  end

  private

  def words_compnation
    words
      .each_cons(2)
      .map { |compantion| proverb_for(compantion) }
  end

  def proverb_for(words)
    "For want of a #{words[0]} the #{words[1]} was lost.\n"
  end

  def last_line
    "And all for the want of a #{detect_qualifier}."
  end

  def detect_qualifier
    qualifier == words[0] ? qualifier : "#{qualifier} #{words[0]}"
  end
end
