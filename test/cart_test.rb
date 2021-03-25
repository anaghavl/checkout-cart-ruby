require 'test/unit'
require_relative '../lib/cart.rb'
require_relative '../lib/pricing_rules/buy_one_get_one_free.rb'
require_relative '../lib/pricing_rules/bulk_discount.rb'

class CartTest < Test::Unit::TestCase
  # Setup object before running the test cases
  def setup
    @buy_one_get_one_free = BuyOneGetOneFree.new('GR1')
    @bulk_discount = BulkDiscount.new('SR1', 3, 0.50)
    @cart = Cart.new([@buy_one_get_one_free, @bulk_discount])
    @shop = @cart.shop
  end

  # Test if cart can scan items present and not present
  def test_cart_scan
    assert_equal @cart.checkout('GR1'), true
    assert_equal @cart.checkout('ML1'), false
    assert_equal @cart.checkout('SR1'), true
  end

  # Tests data from the assignment
  def test_total_checkout_price_for_test_data_1
    @cart.checkout('GR1')
    @cart.checkout('SR1')
    @cart.checkout('GR1')
    @cart.checkout('GR1')
    @cart.checkout('CF1')
    assert_equal 22.45, @cart.total
  end

  def test_total_checkout_price_for_test_data_2
    @cart.checkout('GR1')
    @cart.checkout('GR1')
    assert_equal 3.11, @cart.total
  end

  def test_total_checkout_price_for_test_data_3
    @cart.checkout('SR1')
    @cart.checkout('SR1')
    @cart.checkout('GR1')
    @cart.checkout('SR1')
    assert_equal 16.61, @cart.total
  end
end
