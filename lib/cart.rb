require_relative 'shop'
require_relative 'line_item'

class Cart
  attr_reader :total, :line_items, :shop

  # Initialize the cart with items and available discounts
  def initialize(discounts)
    @discounts = discounts
    strawberry = Item.new('SR1','STRAWBERRY', 5.0)
    green_tea = Item.new('GR1','GREEN TEA', 3.11)
    coffee = Item.new('CF1','COFFEE', 11.23)
    @line_items = []
    @shop = Shop.new(strawberry, green_tea, coffee)
    @item_codes = @shop.item_codes
  end

  # Calculate total amount
  def total
    @discounts.each{ |discount| discount.apply(@line_items) }
    @line_items.inject(0.0){ |total, line_item| total += line_item.price}
  end

  # Scan the items
  def checkout(code)
    if @item_codes.include?(code)
      item = @shop.find(code)
      line_item = LineItem.new(item.code, item.price)
      @line_items.push(line_item)
      true
    else
      false
    end
  end

  # Show the items in the cart
  def show
    line_items = @line_items.map(&:code).join(', ')
    puts line_items.size > 0 ? "Items: #{line_items}" : 'Cart is empty'
    puts "Total: #{self.total}£"
  end

end
