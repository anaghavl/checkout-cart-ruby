require 'test/unit'
require_relative '../lib/shop.rb'

class ShopTest < Test::Unit::TestCase

  # Setup object before running the test cases
  def setup
    strawberry = Item.new('SR1','STRAWBERRY', 5.0)
    green_tea = Item.new('GR1','GREEN TEA', 3.11)
    coffee = Item.new('CF1','COFFEE', 11.23)
    @shop = Shop.new(strawberry, green_tea, coffee)
  end

  # Test the number of items
  def test_number_of_items
    assert_equal 3, @shop.items_quantity, 'Shop has 3 items'
  end

  # Test the item search method
  def test_find_item_in_shop
    item = @shop.items.first
    assert_equal nil, @shop.find('Milk')
    assert_equal [ item.code, item.name, item.price], @shop.find(item.code).to_a
  end

  # Test adding new item to the shop
  def test_add_new_item_to_shop
    #Add new item to the shop
    @shop.add_item("ML1", "MILK", 10.0)
    item = @shop.find("ML1")

    # Check if quantity has increased
    assert_equal 4, @shop.items_quantity, 'Shop has 4 items'

    # Check if item exists
    assert_equal [ item.code, item.name, item.price], @shop.find(item.code).to_a
  end

  # Test array with all the item codes
  def test_the_array_of_item_codes
    codes = []
    item_codes = @shop.item_codes
    @shop.items.each{ |item| codes.push(item.code) }
    assert_equal codes, item_codes
  end
end