require_relative 'item'
require 'terminal-table'
require 'byebug'

class Shop
  attr_reader :items

  # Initialize stock with the items
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

  # Find item in the stock
  def find(code)
    @stock[code.to_sym]
  end

  # Number of items
  def items_quantity
    @stock.size
  end

  # List all the items in stock
  def list
    Terminal::Table.new(title: "Items in Stock", headings: [ 'Code', 'Name', 'Price'], rows: to_a)
  end

  # Admin Operations

  # Delete item from stock
  def delete_item(code)
    @stock.delete(code.to_sym)
  end

  # Add item
  def add_item(code, name, price)
    item = Item.new(code, name, price)
    @stock[code.to_sym] = item
  end

  private
  # Items as array of arrays
  def to_a
    items = []
    @stock.each do |code, item|
      items.push(item.to_a)
    end
    items
  end
end
