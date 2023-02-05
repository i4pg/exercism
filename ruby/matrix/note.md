## matrix
First, I needed to detect the rows in the matrix. I wrote the following code to accomplish this:

@rows = matrix.split(/\n/).map(&:split).map { |row| row.map(&:to_i) }

I later found a more elegant solution in the community solutions:

@rows = text.lines.map { |l| l.split.map(&:to_i) }

Both of these methods achieve the same thing, but the latter is arguably more readable.

Next, I needed to find a way to transpose the matrix (i.e. turn the rows into columns and vice versa). I wrote the following method:

def transpose
  result = []
  (0...self[0].size).each do |col|
    new_row = (0...size).map { |row| self[row][col] }
    result << new_row
  end
  result
end

However, I later discovered that there is a built-in method for this called Array#transpose. Using this method, I was able to simplify my code and make it more efficient.

Finally, I put everything together in the Matrix class:

class Matrix
  attr_reader :rows, :columns
  def initialize(matrix)
    @rows = matrix.split(/\n/).map(&:split).map { |row| row.map(&:to_i) }
    @columns = @rows.transpose
  end
end

This class takes in a matrix as a string and separates it into rows and columns, which can then be accessed using the rows and columns methods. Overall, I found this exercise to be a great learning experience, and I hope that my solution can help others who are working on this exercise.
