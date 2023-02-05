class Pangram
  def self.pangram?(sentence)
    sentence = sentence
               .downcase
               .scan(/[a-z]/)
               .uniq
               .sort
    sentence == ('a'..'z').to_a
  end
end

