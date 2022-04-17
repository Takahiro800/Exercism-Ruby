module Gigasecond
  def self.from(time)
    time + 10 ** 9
  end
end

p Gigasecond.from(Time.utc(1959, 7, 19, 0, 0, 0))