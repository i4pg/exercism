class Clock
  include Comparable
  attr_reader :minute, :hour

  MAX_HOUR = 24
  MAX_MINUTES = 60
  TWO_DIGIT = 10

  def initialize(hour: 0, minute: 0)
    @minute = minute_rolls(minute)
    @hour = hours_rolls(hour)
  end

  def minute_rolls(minute, over_hour = 0)
    if minute.negative?
      over_hour -= 1
      minute += MAX_MINUTES
      return minute_rolls(minute, over_hour) # recursion
    elsif minute >= MAX_MINUTES
      over_hour += 1
      minute -= MAX_MINUTES
      return minute_rolls(minute, over_hour) # recursion
    end

    @over_hours = over_hour
    minute_format(minute)
  end

  def hours_rolls(hour)
    hour += @over_hours
    @over_hours = 0 # After adding the over hours to the total hours we must empty it, in case of recursion

    if hour.negative?
      hour += MAX_HOUR
      return hours_rolls(hour) # recursion
    elsif hour > MAX_HOUR
      hour %= MAX_HOUR
    elsif hour == MAX_HOUR
      hour = 0
    end

    hour_format(hour)
  end

  def hour_format(hour)
    return "0#{hour}" if hour < TWO_DIGIT

    hour.to_s
  end

  def minute_format(minute)
    return "0#{minute}" if minute < TWO_DIGIT

    minute.to_s
  end

  def to_s
    "#{@hour}:#{@minute}"
  end

  def +(other)
    minute = @minute.to_i + other.minute.to_i
    hour = @hour.to_i + other.hour.to_i
    Clock.new(hour: hour, minute: minute)
  end

  def -(other)
    minute = @minute.to_i - other.minute.to_i
    hour = @hour.to_i - other.hour.to_i
    Clock.new(hour: hour, minute: minute)
  end

  def <=>(other)
    if @hour > other.hour
      1
    elsif @hour < other.hour
      -1
    elsif @minute > other.minute
      1
    elsif @minute < other.minute
      -1
    else
      0
    end
  end
end
