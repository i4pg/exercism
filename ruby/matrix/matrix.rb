class Matrix
  attr_reader :rows, :columns
  def initialize(matrix)
    @rows = matrix.lines.map { |l| l.split.map(&:to_i) }
    @columns = @rows.transpose
  end
end
