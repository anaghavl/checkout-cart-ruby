class BulkDiscount
  
  # Discount offer when the items are bought in bulk.
  # Not hardcoding the numbers so it could be used 
  # by multiple pricing rules.
  attr_accessor :bulk_discount

  def initialize(code, quantity, bulk_discount)
    @code = code
    @quantity = quantity
    @bulk_discount = bulk_discount
  end

  # Logic to calculate discount when items are bought in bulk.
  def apply(items)
    selected_items = items.select{ |i| i.code == @code}
    selected_items.each{ |item| item.price -= @bulk_discount } if selected_items.size >= @quantity
  end
end