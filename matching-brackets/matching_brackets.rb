class Brackets
  LEFT_OBJECTS = { bracket: '[', parentheses: '(', braces: '{' }
  RIGHT_OBJECTS = { bracket: ']', parentheses: ')', braces: '}' }

  def self.paired?(string)
    left_stack = []
    obj_arr = string.split('')

    for obj in obj_arr
      # p "obj: #{obj}"

      if LEFT_OBJECTS.value?(obj)
        # p "left obj: #{obj}"
        left_stack.push(obj)
        next
      end

      if RIGHT_OBJECTS.value?(obj)
        # p "right obj: #{obj}"
        type = RIGHT_OBJECTS.key(obj)

        return false if left_stack.last != LEFT_OBJECTS[type]
        left_stack.pop
        next
      end
    end

    return left_stack.empty?
  end
end

p Brackets.paired?('[]')
