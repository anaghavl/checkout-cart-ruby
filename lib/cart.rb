require_relative 'item'

class Cart
  attr_reader :total, :items

  # Initialize the cart with items and available discounts
  def initialize(discounts)
    @discounts = discounts
    strawberry = Item.new('SR1', 'STRAWBERRY', 5.0)
    green_tea = Item.new('GR1', 'GREEN TEA', 3.11)
    coffee = Item.new('CF1','COFFEE', 11.23)
    @items = []
  end

  # Calculate total amount
  def total
    @discounts.each{ |discount| discount.apply(@items) }
    @items.inject(0.0){ |total, item| total += item.price}
  end

  # Scan the items
  def scan
  end
end
