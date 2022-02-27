
class SimpleCalculator
  # 例外処理を自作
  class UnsupportedOperation < StandardError
  end


  def self.calculate(first_operand, second_operand, operation)
    if first_operand.class == Integer && second_operand.class == Integer
      if operation == "+"
        return "#{first_operand} + #{second_operand} = #{first_operand + second_operand}"
      elsif operation == "*"
        return "#{first_operand} * #{second_operand} = #{first_operand * second_operand}"
      elsif operation == "/"
        if second_operand == 0
          return "Division by zero is not allowed."
        end
        return "#{first_operand} / #{second_operand} = #{first_operand / second_operand}"
      else
        raise UnsupportedOperation
      end
    else
      raise ArgumentError
    end
  end
end
