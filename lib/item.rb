class Item

  # Access to read code, name and price of each item outside the class.
  attr_reader :code, :name, :price

  # Initialize the Item Object
  def initialize(code, name, price)
    @code = code
    @name = name
    @price = price
  end
end

