module ETL
  def self.transform(old)
    old.each_with_object({}) do |(score, letters), new|
      letters.map do |letter|
        new[letter.downcase] = score
      end
    end
  end
end

