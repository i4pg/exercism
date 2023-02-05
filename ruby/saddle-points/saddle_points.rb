class Matrix
  attr_reader :rows, :columns

  def initialize(matrix)
    @rows = matrix.split("\n").map { |row| row.scan(/\b\d+\b/).map(&:to_i) }
    @columns = rows.transpose
  end

  def saddle_points(result = [])
    rows.map.with_index do |row, index|
      row.map.with_index do |_, i|
        result << [index, columns.index(columns[i])] if row.max == columns[i].min
      end
    end
    result
  end
end
