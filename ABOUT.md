# checkout-cart-ruby

Every functionality has comments explaining what they do but here is a small note to understand the project better!


## Architecture of the Models

**ITEMS:** Has Code, Name and Price

**SHOP:** Holds all the items available and acts as an interface to interact and shop items.

**CART:** Holds all the items in line items. This class holds the Line Items added by the user and each object has a set of these Line Items as an array. We first validate if the item is present in the shop and then apply any discounts that are available to the same.

**LINE ITEMS:** This is the middle layer between cart and item to handle if there is any change in the price of the item. For example, we don't want to mess with the actual price of the item when discount is applied.

**DISCOUNTS:** Buy one get one free and bulk discount.


The basic flow of the Architecture is:


**[ITEMS: Code, Name, Price]** <-- has many-- **[SHOP: Has stock -> Has items]** <-- belongs to -- **[CART: Has Line Items]**
                                                                                                           
                                                                                                    |
                                                                                                    |
                                                                                                    |
                                                                                                    V
**[DISCOUNTS- buy one get one free and bulk discount]** -- applied to --> **[LINE_ITEMS: Has items]**-- has many ----



## Architecture of the Code

**Lib ->** 

  1. pricing_rules ->
  
    Add all the pricing rules logic here
     1. buy_one_get_one_free.rb
     2. bulk_discount.rb
    
  2. cart.rb
  3. item.rb
  4. line_item.rb
  5. shop.rb


**Test ->**
  Tests for the functionalities
  1. shop_test.rb
  2. item_test.rb
  3. cart_test.rb
  4. buy_one_get_one_free_test.rb
  5. bulk_discount_test.rb

run.rb (Main file to run)
  


## Discounts
Discounts are placed inside the pricing rule and is isolated from the items and the quantity. These offeres can be applied to any item and any quantity by the admin.
**Buy one get one free :** When you buy 2 of the same kind with this offer second one is free. ex. green tea.
**Bulk Discount :** When items are bought in bulk we have a price drop. ex. If you buy 3 or more strawberries, the price should drop to £4.50.

##  UI/UX 

Used teminal table to make things look organized. As of now the UI is the command line which can be moved to the webpage by using Rails. But I have made the UX intuitve and easy to use.


## Testing

Unit testing on every important functionality using Test::Unit::TestCase

## Extra Mile

1. Surprise! Added some functionalities for Admin of the Application. To create and delete items from the shop.
2. Added Unit tests.

## What would I improve?

1. Add authentication for Admin to perform create and delete operation.
2. Create users and add authentication for them.
3. The architecture makes it easy to connect to a database and so I would use Rails to add better functionalities, integrate with psql and better UI.

## How to run?
ruby run.rb

## Final note
Made with ❤️


Thank you for the opportunity!


