class BinarySearch
  attr_reader :arr

  def initialize(arr)
    @arr = arr
  end

  def search_for(num)
    first = 0
    last = arr.size - 1

    while first <= last
      middle = (first + last).div(2)
      return middle if arr[middle] == num

      arr[middle] > num ? last = middle - 1 : first = middle + 1
    end
    nil
  end
end
