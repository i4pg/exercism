module Raindrops
  SOUNDS = { Pling: 3, Plang: 5, Plong: 7 }.freeze
  def self.convert(digit, result = [])
    SOUNDS.each { |sound, factor| result << sound if (digit % factor).zero? }
    result.empty? ? digit.to_s : result.join
  end
end
