class Item

  # Access to read code, name and price of each item outside the class.
  attr_reader :code, :name, :price

  # Initialize the Item Object
  def initialize(code, name, price)
    @code = code
    @name = name
    @price = price
  end

  # Return as a row in the table
  def to_s
    table = Terminal::Table.new(headings: ['Item Code', 'Name', 'Price'], rows: [ to_a ])
  end

  # Return array of the object
  def to_a
    [ @code, @name, @price ]
  end
end

