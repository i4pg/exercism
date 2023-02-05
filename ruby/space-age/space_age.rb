class SpaceAge
  def method_missing(mth, *args)
    if mth.to_s.start_with?('on')
      planet = mth.match(/_(\w+)/).captures.first.upcase
      planet_year = SpaceAge.const_get("#{planet}_YEAR")
      (@seconds / (SECONDS_PER_YEAR * planet_year)).round(2)
    else
      super
    end
  end

  SECONDS_PER_YEAR = 31_557_600.0
  EARTH_YEAR = 1.0
  MERCURY_YEAR = 0.2408467
  VENUS_YEAR = 0.61519726
  MARS_YEAR = 1.8808158
  JUPITER_YEAR = 11.862615
  SATURN_YEAR = 29.447498
  URANUS_YEAR = 84.016846
  NEPTUNE_YEAR = 164.79132

  def initialize(input)
    @seconds = input
  end
end
