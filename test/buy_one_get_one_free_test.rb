require 'test/unit'
require_relative '../lib/pricing_rules/buy_one_get_one_free.rb'
require_relative '../lib/cart.rb'

class BuyOneGetOneFreeTest < Test::Unit::TestCase
  # Setup object before running the test cases
  def setup
    @buy_one_get_one_free = BuyOneGetOneFree.new('GR1')
    @cart = Cart.new([@buy_one_get_one_free])
    @shop = @cart.shop
    @coffee = @shop.find('CF1')
    @strawberry = @shop.find('SR1')
    @green_tea = @shop.find('GR1')

    # Add green tea to line items
    @green_tea_in_cart_1 = LineItem.new(@green_tea.code, @green_tea.price)
    @green_tea_in_cart_2 = LineItem.new(@green_tea.code, @green_tea.price)
    @green_tea_in_cart_3 = LineItem.new(@green_tea.code, @green_tea.price)
    @green_tea_in_cart_4 = LineItem.new(@green_tea.code, @green_tea.price)
    
    # Add strawberry to line items
    @strawberry_in_cart_1 = LineItem.new(@strawberry.code, @strawberry.price)
    @strawberry_in_cart_2 = LineItem.new(@strawberry.code, @strawberry.price)

    # Add coffee to line items
    @coffee_in_cart_1 = LineItem.new(@coffee.code, @coffee.price)
  end

  # Test if the item is not applicable for discount.
  def test_discount_on_item_not_valid_for_discount
    # Add 2 strawberries and one coffee
    line_items = [ @strawberry_in_cart_1, @coffee_in_cart_1, @strawberry_in_cart_2 ]
    @buy_one_get_one_free.apply(line_items)

    # Test if the discount is applied
    assert_equal @strawberry_in_cart_1.price, @strawberry.price, "Discount not applied"
    assert_equal @strawberry_in_cart_2.price, @strawberry.price, "Discount not applied"
  end

  def test_discount_on_item_valid_for_discount
    # Add 2 greentea and coffee to line items
    line_items = [ @green_tea_in_cart_1, @coffee_in_cart_1,  @green_tea_in_cart_2]
    @buy_one_get_one_free.apply(line_items)

    # Test if the discount is applied
    assert_equal @green_tea_in_cart_1.price, @green_tea.price, "Discount not applied"
    assert_equal @green_tea_in_cart_2.price, 0 , "Discount applied"
    assert_equal @coffee_in_cart_1.price, @coffee.price, "Discount not applied"
  end

  # Test when odd number of valid items are in the cart
  def test_discount_with_odd_number_of_items_valid_for_discount
    # Add 3 greentea to line items
    line_items = [ @green_tea_in_cart_1, @green_tea_in_cart_2,  @green_tea_in_cart_3]
    @buy_one_get_one_free.apply(line_items)

    # Test if the discount is applied
    assert_equal @green_tea_in_cart_1.price, @green_tea.price, "Discount not applied"
    assert_equal @green_tea_in_cart_2.price, 0 , "Discount applied"
    assert_equal @green_tea_in_cart_3.price, @green_tea.price, "Discount not applied"
  end

  # Test when even number of valid items are in the cart
  def test_discount_with_even_number_of_items_valid_for_discount
    # Add 3 greentea to line items
    line_items = [ @green_tea_in_cart_1, @green_tea_in_cart_2,  @green_tea_in_cart_3, @green_tea_in_cart_4]
    @buy_one_get_one_free.apply(line_items)

    # Test if the discount is applied
    assert_equal @green_tea_in_cart_1.price, @green_tea.price, "Discount not applied"
    assert_equal @green_tea_in_cart_2.price, 0 , "Discount applied"
    assert_equal @green_tea_in_cart_3.price, @green_tea.price, "Discount not applied"
    assert_equal @green_tea_in_cart_4.price, 0 , "Discount applied"
  end
end
