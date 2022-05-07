module Accumlating
  def accumulate
    return to_enum(:accumlate) unless block_given?
    each_with_object([]) { |elem, result| result << yield(elem) }
  end
end

Array.include(Accumlating)
