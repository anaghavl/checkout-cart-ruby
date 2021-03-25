require 'test/unit'
require_relative '../lib/pricing_rules/bulk_discount.rb'
require_relative '../lib/cart.rb'
require_relative '../lib/line_item.rb'
require 'byebug'

class BulkDiscountTest < Test::Unit::TestCase
  # Setup object before running the test cases
  def setup
    @bulk_discount = BulkDiscount.new('SR1', 3, 0.50)
    @cart = Cart.new([@bulk_discount])
    @shop = @cart.shop
    @coffee = @shop.find('CF1')
    @strawberry = @shop.find('SR1')
    @green_tea = @shop.find('GR1')

    # Add green tea to line items
    @green_tea_in_cart_1 = LineItem.new(@green_tea.code, @green_tea.price)
    @green_tea_in_cart_2 = LineItem.new(@green_tea.code, @green_tea.price)
    @green_tea_in_cart_3 = LineItem.new(@green_tea.code, @green_tea.price)
    
    # Add strawberry to line items
    @strawberry_in_cart_1 = LineItem.new(@strawberry.code, @strawberry.price)
    @strawberry_in_cart_2 = LineItem.new(@strawberry.code, @strawberry.price)
    @strawberry_in_cart_3 = LineItem.new(@strawberry.code, @strawberry.price)
  end

  # Test if discount gets applied on valid item and quantity
  def test_discount_on_bulk_quantity_of_item
    # Add 3 strawberries to line items
    line_items = [ @strawberry_in_cart_1, @strawberry_in_cart_2,  @strawberry_in_cart_3]
    @bulk_discount.apply(line_items)

    # Test if the discount is applied
    assert_equal @strawberry_in_cart_1.price, @strawberry.price - @bulk_discount.bulk_discount, "Discount applied"
    assert_equal @strawberry_in_cart_2.price, @strawberry.price - @bulk_discount.bulk_discount, "Discount applied"
    assert_equal @strawberry_in_cart_3.price, @strawberry.price - @bulk_discount.bulk_discount, "Discount applied"
  end

  # Test if the item is valid but not enough quantity
  def test_discount_on_less_quantity_of_item
    # Add 2 strawberries to line items
    line_items = [ @strawberry_in_cart_1, @strawberry_in_cart_2]
    @bulk_discount.apply(line_items)

    # Test if the discount is applied
    assert_equal @strawberry_in_cart_1.price, @strawberry.price, "Discount not applied"
    assert_equal @strawberry_in_cart_2.price, @strawberry.price, "Discount not applied"
  end

  # Test if quantity is valid but the item 
  # is not applicable for discount.
  def test_discount_on_item_not_valid_for_discount
    # Add 3 green tea to line items
    line_items = [ @green_tea_in_cart_1, @green_tea_in_cart_2, @green_tea_in_cart_3]
    @bulk_discount.apply(line_items)

    # Test if the discount is applied
    assert_equal @green_tea_in_cart_1.price, @green_tea.price, "Discount not applied"
    assert_equal @green_tea_in_cart_2.price, @green_tea.price, "Discount not applied"
    assert_equal @green_tea_in_cart_3.price, @green_tea.price, "Discount not applied"
  end
end