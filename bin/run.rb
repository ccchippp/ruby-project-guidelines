require_relative '../config/environment'
require 'pry'

chip = User.create(username: "Chip")
abe = User.create(username: "Abraham")


coffee = Item.create(item: "coffee", price: 16.00)
shirt = Item.create(item: "shirt", price: 20.00)
sock = Item.create(item: "socks", price: 5.00)






binding.pry

puts "HELLO WORLD"
