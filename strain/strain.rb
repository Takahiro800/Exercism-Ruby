class Array
  def keep
    kept = []
    each { |item| kept << item if yield item }
    kept
  end

  def discard
    keep { |item| not yield item }
  end
end
