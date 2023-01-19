class WordProblem
  def initialize(text)
    @problem = text.gsub(/What is /,'').gsub(/multiplied by/, 'multiple').gsub(/divided by/, 'devided').gsub('?', '')
  end

  def answer
    nums = @problem.split(' ').select.with_index{|str, i| i % 2 == 0}.map(&:to_i)
    operators = @problem.split(' ').select.with_index{ |num, i|  i % 2 == 1}.map(&:to_sym)

    ans = nums[0]

    operators.each_with_index do |operation, i|
      ans = calculate(ans, nums[i+1], operation)
    end

    ans
  end

  private

  def calculate(a, b, operation)
    case operation
    when :plus
      return a + b
    when :minus
      return a - b
    when :multiple
      return a * b
    when :devided
      return a / b
    else
      raise ArgumentError
    end
  end
end