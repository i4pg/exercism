# frozen_string_literal: true

# verify that any and all pairs are matched and nested correctly
module Brackets
  BRACKETS = { '{' => '}', '[' => ']', '(' => ')' }.freeze
  OPEN_BRACKETS = BRACKETS.keys
  CLOSE_BRACKETS = BRACKETS.values

  def self.paired?(input)
    input.chars.each_with_object([]) do |char, stack|
      if OPEN_BRACKETS.include?(char)
        stack.push(char)
      elsif CLOSE_BRACKETS.include?(char)
        return false unless char.eql?(BRACKETS[stack.last])

        stack.pop
      end
    end.empty? # Enum#each_with_object returns Array, So stack.empty?
  end
end
