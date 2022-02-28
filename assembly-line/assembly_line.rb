class AssemblyLine
  def initialize(speed)
    @speed = speed
  end

  def production_rate_per_hour
    num = 221
    case @speed
    when 1..4
      @speed * num
    when 5..8
      @speed * num * 0.9
    when 9
      @speed * num * 0.8
    when 10
      @speed * num * 0.77
    end
  end

  def working_items_per_minute
    (production_rate_per_hour / 60).floor
  end
end

p AssemblyLine.new(6).production_rate_per_hour
p AssemblyLine.new(6).working_items_per_minute