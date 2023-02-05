class Clock
  attr_reader :minutes

  TIME_FORMAT = '%02i:%02i'
  HOURS_PER_DAY = 24
  MINUTES_PER_HOUR = 60
  MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

  def initialize(hour: 0, minute: 0)
    @minutes = ((hour * MINUTES_PER_HOUR) + minute) % MINUTES_PER_DAY
  end

  def +(other)
    self.class.new(minute: minutes + other.minutes)
  end

  def -(other)
    self.class.new(minute: minutes - other.minutes)
  end

  def ==(other)
    minutes == other.minutes
  end

  def to_s
    TIME_FORMAT % minutes.divmod(MINUTES_PER_HOUR)
  end
end
