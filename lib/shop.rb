require_relative 'item'

class Shop
  attr_reader :items

  def initialize(*args)
    @stock = args.map{ |item| [item.code.to_sym, item] }.to_h
  end

  def items
    @stock.values
  end

  # Array with all the item codes
  def item_codes
    @stock.values.map(&:code)
  end
end
