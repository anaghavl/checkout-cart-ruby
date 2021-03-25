require_relative 'lib/cart.rb'
require_relative 'lib/pricing_rules/buy_one_get_one_free.rb'
require_relative 'lib/pricing_rules/bulk_discount.rb'
require 'byebug'

# Initialize pricing rules for items
@buy_one_get_one_free = BuyOneGetOneFree.new('GR1')
@bulk_discount = BulkDiscount.new('SR1', 3, 0.50)

# Initialize shopping cart
@cart = Cart.new([@buy_one_get_one_free, @bulk_discount])
@shop = @cart.shop

# Common lines to print
def newline
  puts "\n"
end

def prompt
  print '=> '
end

# Initialize choice to 0
choice = 0

# Menu to list catalog, search for item, 
# add to cart, checkout and admin options.
while choice != 6
  newline
  puts """
    ~ SHOPPING MALL ~
      1. Show Catalog
      2. Find Item
      3. Add to cart
      4. Checkout
      5. Admin Menu
      6. Exit
  """
  prompt

  choice = gets.chomp.to_i
  newline

  case choice

  # Lists all the items in the shop
  when 1
    puts @shop.list

  # Search for item in the shop
  when 2
    puts 'Please enter item code'
    prompt
    code = gets.chomp

    item = @shop.find(code)
    newline
    puts item.nil? ? 'This item does not exist in the shop' : item.to_s

  # Lists the Catalog of the shop
  # Reads the code to add the items in the cart.
  when 3
    puts @shop.list
    puts 'Please enter item code:'
    prompt
    code = gets.chomp

    newline
    puts @cart.checkout(code) ? 'The item was added to your cart' : 'This item does not exist'

  # Shows the items in the cart and the total price
  when 4
    @cart.show

  # Displays the Admin Menu to create and delete items
  when 5 
   puts """ 
    ~ ADMINISTRATOR MENU ~
      1. Create Item
      2. Delete Item
      3. Back to the previous menu
    """
    prompt
    choice_1 = gets.chomp.to_i
    case choice_1
      when 1
        puts 'Please enter item code:'
        prompt
        code = gets.chomp
        prompt
        puts 'Please enter name:'
        prompt
        name = gets.chomp
        puts 'Please enter price:'
        prompt
        price = gets.chomp.to_f

        @shop.add_item(code, name, price)
        item = @shop.find(code)
        newline
        puts 'The next item was created successfully'
        puts item.to_s
      
      when 2
        puts 'Please enter code:'
        prompt
        code = gets.chomp

        puts @shop.delete_item(code)? 'The item was deleted successfully' : 'Item does not exist'
        newline
      when 3
        puts 'Welcome back to the shop!'
      else
        puts 'Wrong Entry'
    end
  
  # Exits the shopping application
  when 6
    puts 'Happy Shopping, visit again!'
  else
    puts 'Please select a correct choice'
  end
end