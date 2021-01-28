User.destroy_all
Cart.destroy_all


user_1 = User.create(username: "user_one")
# user_2 = User.create(username: "user_two")
# user_3 = User.create(username: "user_three")
# user_4 = User.create(username: "user_four")

item_1 = Item.create(item: "banana", price: 7)

cart_1 = Cart.create()

cart_1.user_id = user_1.id
cart_1.items_id = item_1
#cart_1.items_id[item_1.item] = item_1.price
cart_1.save


# item_2 = 
# item_3 = 
# item_4 = 
# item_5 = 



# order_1 = Order.create(processed: false)