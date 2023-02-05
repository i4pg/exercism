## Luhn
I've been working on the Luhn exercise from Exercism, and I wanted to share my experience and solution with the community.

I found this exercise to be quite challenging, despite it being labeled as an "easy" level. I struggled to fully understand the algorithm and had to spend a lot of time debugging and refactoring my code. One of the main issues I encountered was a small mistake in my code that caused several tests to fail.

Here's the initial version of my code:

    digits = digits.chars.map.with_index do |char, index|
      if index.even?
        char.to_i
      else
        char = char.to_i * 2
        char -= 9 if char > 9
      end
    end

The problem with this code is that I forgot to return a value from the last statement in the map block, which resulted in a lot of nil values. Specifically, I forgot to add char in the last line, so the Ruby interpreter evaluated it as a return statement.

I later came across a solution that uses a pipeline (or "assembly line") approach, which I found to be very elegant and concise. Here's the final version of my solution:

  def self.valid?(input)
    input
      .gsub(/\s/, '')
      .tap { |s| return false unless s[/\A\d\d+\z/] }
      .chars
      .reverse
      .map.with_index { |d, i| i.odd? ? d.to_i * 2 : d.to_i }
      .map { |d| d > 9 ? d - 9 : d }
      .sum % 10 == 0
  end

This version of the solution uses a pipeline of method calls to process the input and check for its validity. It eliminates the need for guard clauses and makes the code more readable.

Overall, I found this exercise to be a great learning experience, and I hope that my solution and observations can help others who are working on this exercise.
