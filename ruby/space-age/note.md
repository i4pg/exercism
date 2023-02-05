## Space Age
### A Study in Method Overriding
This exercise gave me the chance to redefine one of the built-in methods --- `BasicObject#method_missing`---. In fact, Rubyists often tend to change its behavior.
## What it does
As the name suggests, if you send any undefined method against any object, this method gets triggered before encountering any exceptions or errors.
## How to work with it
With this in mind, the test of this exercise basically involves calling `on_<some planet>` against each instance. Instead of defining a method for each planet, let's just play with `BasicObject#method_missing` and make it deal with our space planets.
```Ruby
class SpaceAge
  def initialize(age)
    @age_in_seconds = age
  end

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
end
```
And that's it! With this approach, you can easily add support for new planets simply by adding a constant for the planet's year length, without needing to define a new method for each planet.
