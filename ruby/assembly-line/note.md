## Assembly Line
Welcome to the AssemblyLine!

At first, I had implemented the following hash to store the success rates based on different speed ranges:
```Ruby
SUCCESS_RATE = { 1 => 1..4,
                   0.90 => 5..8,
                   0.80 => 9..9,
                   0.77 => 10..10 }.freeze
```

and then created a method to find the appropriate success rate based on the current speed:

def calculate_rate
    SUCCESS_RATE.select { |_, rate| rate.include?(@speed) }.first[0]
  end

However, I later realized that there could be a more efficient way to achieve this.

I continued to research and found that using a switch case statement could improve the readability and maintainability of the code. So, I rewrote the success rate method to use a switch case statement, like this:

def success_rate
    case @custom_speed
    when 1..4
      1.0
    when 5..8
      0.90
    when 9..9
      0.80
    when 10..10
      0.77
    end
  end

I also found that using the find method could return the first match in the form of key-value pair, like this:

def success_rate
    SUCCESS_RATE.find { |_, range| range.include?(@speed) }.first
  end

I am also interested in the functional programming approach and have been impressed by its ability to solve problems. Although I am not yet ready to implement it, I believe it could be a valuable addition to my skillset.

Here's an example of how I might use functional programming to calculate the production rate and items per minute:

class AssemblyLine
  def initialize(speed)
    @speed = speed
  end

  def production_rate
    success_rate = lambda { |speed|
      case speed
      when 1..4 then 1
      when 5..8 then 0.9
      when 9..9 then 0.8
      when 10..10 then 0.77
      end
    }
    rate = ->(speed) { speed * 221 }
    rate.call(@speed) * success_rate.call(@speed)
  end

  def items_per_minute
    items = ->(rate) { (rate / 60).to_i }
    items.call(production_rate)
  end
end

I believe that functional programming is an art form and I am looking forward to learning more about it and implementing it in my work.

Thank you for your time, and I hope you find this article informative.
