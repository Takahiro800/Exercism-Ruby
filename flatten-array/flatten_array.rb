class FlattenArray < Array
  def self.flatten(array)
    return array.flatten.compact
  end
end
