class LineItem

  # Line Item is associated with both item and the cart. 
  # This class will have item-code from one item in the shop 
  # and the price of it which can be changed due to any 
  # offers applied.
  
  # Access to read code and price outside the class.
  attr_reader :code
  attr_accessor :price

  # Initialize the Line Item Object
  def initialize(code, price)
    @code, @price = code, price
  end
end