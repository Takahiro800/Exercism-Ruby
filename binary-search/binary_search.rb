class BinarySearch
  attr_reader :array

  def initialize(nums_array)
    @array = nums_array
  end

  def search_for(number)
    return nil if array.size == 0
    search_for_helper(number, 0, array.size - 1)
  end

  private

  def search_for_helper(key, start, last)
    return nil if start > last

    mid = ((start + last) / 2).floor
    return mid if array[mid] == key

    return nil if start == last

    key < array[mid] ? search_for_helper(key, start, mid - 1) : search_for_helper(key, mid + 1, last)
  end
end
