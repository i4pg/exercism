module Acronym
  def self.abbreviate(phrase)
    phrase.split(/\W/).map(&:chr).join.upcase
  end
end
