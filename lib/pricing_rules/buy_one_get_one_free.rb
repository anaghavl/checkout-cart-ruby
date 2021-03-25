class BuyOneGetOneFree

  # Discount offer to buy one get one free
  def initialize(code)
    @code = code
  end

  # Logic to calculate buy one get one free.
  def apply(line_items)
    selected_items = line_items.select{ |i| i.code == @code}
    if selected_items.size >= 2
      selected_items.each_slice(2) do |line_items, item_free|
        item_free.price = 0 unless item_free.nil?
      end
    end
  end
end
