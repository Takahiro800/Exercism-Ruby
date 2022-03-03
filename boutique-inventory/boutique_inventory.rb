class BoutiqueInventory
  def initialize(items)
    @items = items
  end

  def item_names
    names = []
    @items.each do |item|
      names << item[:name]
    end
    names.sort
  end

  def cheap
    # cheap_items = []
    # cheap_items << @items.select { |item| item[:price] < 30 }
    @items.select { |item| item[:price] < 30 }
  end

  def out_of_stock
    # out_items = []
    # out_items << @items.select { |item| item[:quantity_by_size].empty?}
    @items.select { |item|  item[:quantity_by_size].empty?}
  end

  def stock_for_item(name)
    @items.each do |item|
      return item[:quantity_by_size] if item[:name] == name
    end
  end

  def total_stock
    @items.inject(0) {|sum, hash| sum + hash[:quantity_by_size].values.inject(0,:+)}
  end
end

sampule = BoutiqueInventory.new([
  {price: 65.00, name: "Maxi Brown Dress", quantity_by_size: {s: 3, m: 7, l: 8, xl: 4}},
  {price: 50.00, name: "Red Short Skirt", quantity_by_size: {}},
  {price: 29.99, name: "Black Short Skirt", quantity_by_size: {s: 1, xl: 4}},
  {price: 20.00, name: "Bamboo Socks Cats", quantity_by_size: {s: 7, m: 2}}
])

p sampule.total_stock