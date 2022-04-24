class Clock
  # オブジェクトの比較を定義するために導入
  include Comparable

  MINUTES_PER_HOUR = 60
  HOURS_PER_DAY = 24
  MINUTES_PER_DAY = MINUTES_PER_HOUR * HOURS_PER_DAY

  attr_reader :total_minutes

  def initialize(hour: 00, minute: 00)
    @total_minutes = (hour * MINUTES_PER_HOUR + minute) % MINUTES_PER_DAY
  end

  def hour
    (total_minutes / MINUTES_PER_HOUR) % HOURS_PER_DAY
  end

  def minute
    total_minutes % MINUTES_PER_HOUR
  end

  def to_s
    '%02d:%02d' % [hour, minute]
  end

  def +(other)
    Clock.new(minute: @total_minutes + other.total_minutes)
  end

  def -(other)
    Clock.new(minute: @total_minutes - other.total_minutes)
  end

  def <=>(other)
    total_minutes <=> other.total_minutes
  end
end
