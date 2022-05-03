class ETL
  def self.transform(old)
    old = old.invert
    arr_keys = old.keys.select { |key| key.class == Array }

    arr_keys.each do |key|
      value = old[key]
      key.each { |i| old[i.downcase] = value }
      old.delete(key)
    end
    return old
  end
end
