module Raindrops
  RAIN_HASH = {
    3 => "Pling",
    5 => "Plang",
    7 => "Plong"
  }.freeze

  def self.convert(number)
    # 同じ表記が続くのでemaptyの時だけ置換するようにする
    # RAIN_HASH.select { |k, _| n % k == 0}.values.join.empty? ? n.to_s : RAIN_HASH.select { |k, _| n % k == 0}.values.join
    RAIN_HASH.select { |key, _| number % key == 0}.values.join.gsub(/^$/, number.to_s)
  end
end
