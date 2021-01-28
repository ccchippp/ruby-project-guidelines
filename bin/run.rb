require_relative '../config/environment'

User.destroy_all
Cart.destroy_all
Item.destroy_all


user_1 = User.create(username: "user_one")

banana = Item.create(item: 'banana', price: 0.3)
apple = Item.create(item: 'apple', price: 0.2)
orange = Item.create(item: 'orange', price: 0.5)
grape = Item.create(item: 'grape', price: 0.4)

puts "~~~~~~~~"

p user_1.user_cart

puts "~~~~~~~~"
p User.all
p Item.all
puts "~~~~~~~~"
puts "~~~~~~~~"



#p User.all

# p User.column_names  #=> ["id", "username"]
# p Cart.column_names  #=> ["id", "user_id", "items_id"]
# p Item.column_names  #=> ["id", "item", "price"]
# p Order.column_names #=> ["id", "processed", "user_id"]



# rake db:drop:all
# rake db:migrate
# ruby bin/run.rb