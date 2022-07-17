class BinarySearch
  attr_reader :root

  def initialize(nums_array)
    return null if nums_array.size == 0

    @root = sortedArrayToBSTHelper(nums_array, 0, nums_array.size - 1)
  end

  def search_for(number)
    iterator = @root
    depth = 0
    while iterator != 'None'
      if iterator.data == number
        p 'match!!!'
        iterator.data
      end

      if iterator.data > number
        p "number: #{number}, iterator.data: #{iterator.data}, result: left"
        iterator = iterator.left
      else
        p "number: #{number}, iterator.data: #{iterator.data}, result: right"
        iterator = iterator.right
      end
    end

    return iterator != 'None' ? iterator.data : 'None'
  end

  private

  def sortedArrayToBSTHelper(nums_array, start, last)
    return BinaryTree.new(nums_array[start]) if start == last

    mid = ((start + last) / 2).floor
    if (mid - 1 >= start)
      left = sortedArrayToBSTHelper(nums_array, start, mid - 1)
    else
      left = 'None'
    end

    if (mid + 1 <= last)
      right = sortedArrayToBSTHelper(nums_array, mid + 1, last)
    else
      right = 'None'
    end

    @root = BinaryTree.new(nums_array[mid], left, right)
  end
end

class BinaryTree
  attr_accessor :data, :right, :left

  def initialize(data, left = 'None', right = 'None')
    @data = data
    @left = left
    @right = right
  end
end

binary = BinarySearch.new([1, 3, 4, 6, 8, 9, 11])

p binary
p binary.search_for(4)
