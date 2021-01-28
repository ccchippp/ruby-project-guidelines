User.destroy_all
Cart.destroy_all
Item.destroy_all


user_1 = User.create(username: "user_one")
# user_2 = User.create(username: "user_two")
# user_3 = User.create(username: "user_three")
# user_4 = User.create(username: "user_four")

cart_1 = Cart.create()

item_1 = Item.create(item: "banana", price: 0.25)

cart_1.user_id = user_1.id
cart_1.item_id = item_1.id

#item_2 = 
#item_3 = 
#item_4 = 
#item_5 = 



# order_1 = Order.create(processed: false)