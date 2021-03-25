require 'test/unit'
require_relative '../lib/item.rb'

class ItemTest < Test::Unit::TestCase

  # Setup object before running the test cases
  def setup
    @code = 'SR1'
    @name = 'STRAWBERRY'
    @price = 5.00
    @item = Item.new(@code, @name, @price)
  end

  # Test new item creation
  def test_new_item_creation
    assert_equal @code, @item.code, 'item code is ok'
    assert_equal @name, @item.name, 'item name is ok'
    assert_equal @price, @item.price, 'item price is ok'
  end

  # Test creation of object into array
  def test_creation_of_array
    assert_equal [ @code, @name, @price], @item.to_a, 'Conversion to array is ok'
  end
end