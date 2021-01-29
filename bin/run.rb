
require_relative '../config/environment'
require 'pry'

# User.destroy_all
# Item.destroy_all
# Cart.destroy_all

# chip = User.create(username: "Chip")
# abe = User.create(username: "Abraham")

# chips_cart = Cart.create

# coffee = Item.create(item: "coffee", price: 16.00)
# shirt = Item.create(item: "shirt", price: 20.00)
# socks = Item.create(item: "socks", price: 5.00)
# book = Item.create(item: "book", price: 18.00)



# chips_cart.items << coffee
# chips_cart.items << shirt
# chips_cart.items << socks
# chip.carts << chips_cart

# temp = Orders.create
# puts "~~~~~~"
# puts "~~~~~~"
# p temp
# puts "~~~~~~"
# temp.carts << chips_cart
# temp.carts << chips_cart
# temp.carts << chips_cart
# puts "~~~~~~"
# puts "~~~~~~"
# p temp.carts
# puts "~~~~~~"
# tem = temp.carts
# p tem[-1].user_id
# p tem[-1].user
# p tem[-1].items
# puts "~~~~~~"
# p temp
# puts "~~~~~~"
# puts "~~~~~~"
# p Orders.all
# puts "~~~~~~"
# p Orders.all[-1]
# puts "~~~~~~"
# puts "~~~~~~"
# p Orders.all[-1].carts
# tempp = Orders.all[-1].carts
# puts "~~~~~~"
# puts "~~~~~~"
# p tempp
# puts "~~~~~~"
# puts "~~~~~~"
# ans = Cart.find_by(user_id: tempp[0].user_id)
# p ans.items
# puts "~~~~~~"


# binding.pry

NotAmazon.open_store


=begin
things to do:
    > finish make_purchase
        adding stuff to cart
        probably write seperate method for checking out
    > in owner_task:
        check orders
        add new item to inventory
=end