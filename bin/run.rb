
require_relative '../config/environment'
require 'pry'

User.destroy_all
Item.destroy_all
Cart.destroy_all

chip = User.create(username: "Chip")
abe = User.create(username: "Abraham")

chips_cart = Cart.create

coffee = Item.create(item: "coffee", price: 16.00)
shirt = Item.create(item: "shirt", price: 20.00)
socks = Item.create(item: "socks", price: 5.00)

chip.carts << chips_cart
chips_cart.items << coffee
chips_cart.items << shirt
chips_cart.items << socks

binding.pry

puts "HELLO WORLD"
