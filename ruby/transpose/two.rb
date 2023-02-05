module Transpose
  def self.transpose(input)
    lines = input.split("\n")
    lines.map! { |ele| ele.split(//) }
    max = lines.max_by(&:size).length
    a = lines.map.with_index do |arr, _index|
      if arr.length < max
        space = max - arr.length
        space = ' ' * space
        arr << space
      end
      arr
    end
    a.map!(&:join)
    a.map! { |ele| ele.split(//) }
    b = a.transpose
    # b.map.with_index do |arr, index|
    #   arr.map.with_index do |_char, i|
    #     if a&.[](index..-1)&.all? { |ar| ar[i] == ' ' } &&
    #        !(b&.[](index + 1)&.[](i) != ' ' unless index == (b.length - 1))

    #       arr.delete_at(i)
    #     end
    #   end
    # end

    puts "before => #{b}"
    b.map.with_index do |arr, index|
      arr.map.with_index do |char, i|
        if char == ' ' && b[index..-1].all? { |ele| ele[i] == ' ' } && b[index..-1].all? do |ele|
             ele[i + 1] == ' ' || !ele[i + 1]
           end
          arr.delete_at(i)
        end
      end
    end
    puts "after => #{b}"
    b.map.with_index do |arr, index|
      arr.map.with_index do |char, i|
        arr.delete_at(i) if char == ' ' && b[index..-1].all? do |ele|
                              ele[i] == ' ' && arr[i + 1] == ' ' || !arr[i + 1] && ele[i] == ' '
                            end
      end
    end
    # p b
    b.map(&:join).join("\n")
  end
end
