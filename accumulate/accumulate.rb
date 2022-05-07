module Accumlating
  def accumulate
    each_with_object([]) { |elem, result| result << yield(elem) }
  end
end

Array.include(Accumlating)
