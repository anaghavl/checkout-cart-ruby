# checkout-cart-ruby

## Architecture of the Models

ITEMS: Has Code, Name and Price

SHOP: Holds all the items available.

CART: Holds all the items in line items.

LINE ITEMS: This is the middle layer between cart and item to handle if there is any change in the price of the item.

DISCOUNTS: Buy one get one free and bulk discount.



The basic flow of the Architecture is:


[ITEMS: Code, Name, Price] <-- has many-- [SHOP: Has stock -> Has items] <-- belongs to -- [CART: Has Line Items]


-- has many --[LINE_ITEMS: Has items]<-- applied to -- [DISCOUNTS- buy one get one free and bulk discount]

## Architecture of the Code

Lib -> 


  > pricing_rules ->
  
        //Add all the pricing rules logic here
    
       > buy_one_get_one_free.rb
    
       > bulk_discount.rb
    
    
  > cart.rb
  
  
  > item.rb
  
  
  > line_item.rb
  
  
  > shop.rb


##  UI/UX 

Used teminal table to make things look organized. As of now the UI is the command line which can be moved to the webpage by using Rails. But I have made the UX intuitve and easy to use.


## Testing

Unit testing on every important functionality using Test::Unit::TestCase

## Extra Mile

Added some functionalities for Admin of the Application. To create and delete items from the shop.

## What would I improve?

1. Add authentication for Admin to perform create and delete operation.
2. Create users and add authentication for them.
3. Use Rails to add better functionalities, integrate with psql and better UI.

## How to run?
ruby run.rb

## Final note
Made with ❤️


Thank you for the opportunity!


