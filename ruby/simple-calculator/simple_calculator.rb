class SimpleCalculator
  class UnsupportedOperation < StandardError; end
  ALLOWED_OPERATIONS = %w[+ / *].freeze

  def self.calculate(*num, operation)
    raise UnsupportedOperation unless ALLOWED_OPERATIONS.include?(operation)
    raise ArgumentError unless num.all?(Numeric)

    begin
      "#{num[0]} #{operation} #{num[1]} = #{num[0].send(operation, num[1])}"
    rescue ZeroDivisionError
      'Division by zero is not allowed.'
    end
  end
end
