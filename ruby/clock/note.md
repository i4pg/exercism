I recently worked on the Clock exercise from Exercism, and I wanted to share my experience and solution with the community.

I really enjoyed this exercise as it was a great opportunity to practice object-oriented programming (OOP) and use some of Ruby's built-in features such as overloading unary operators and the Comparable class. I also used recursive methods to handle overflow scenarios. Here is my initial solution:

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


I realized that my solution is a bit "concretely abstract", which is not the most efficient or elegant way to implement it. I came across another solution that uses basic mathematical calculations and is much more concise and elegant:
```Ruby
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
```
This one uses basic mathematics calculation -which I'm awful at- to get the overall minutes, Then when `to_s` sent to the object, Object will do another mathematics calculation but, This time using `divmod` -Just knew about it!-.
For example, let's say we have the following code:
```Ruby
minutes = 125
hours, minutes = minutes.divmod(60)
```
Here, divmod(60) will divide minutes by 60 and return the result in an array: [2,5]. This is equivalent to 2 being the quotient and 5 being the remainder. And then, we can unpack the array using multiple assignment, so hours will have 2 and minutes will have 5
So In the line of code above, it is used to divide the minutes by `MINUTES_PER_HOUR` constant, which probably is 60, it returns an array with two elements, the quotient and the remainder, which can be used to format the string with hours and minutes in *hh:mm* format.
