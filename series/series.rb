class Series
  def initialize(num)
    @num = num
  end

  def slices(n)
    raise ArgumentError if @num.length < n

    @num.each_char.each_cons(n).map(&:join)
  end
end