class User < ActiveRecord::Base
    has_many :carts
    has_many :items, through: :carts

    def my_cart
        self.carts.collect {|i| i.items}
    end
end


# attr_accessor :username
# attr_reader :user_cart

# def initialize(username)
#     @username = username
# end
# def make_user_cart
#     @user_cart = []
# end
# def make_cart
#     c = Cart.create()
#     self.cart_id = c.id
#     c.user_id = self.id
# end
# def add_cart
#     temp = Cart.find_by(user_id: self.id)
#     self.user_cart.push(temp)
# end
# def add_to_cart(item)
#     if self.user_cart = nil
#         self.make_user_cart
#     end
#     if !(Cart.find_by(user_id: self.id, item_id: nil))
#         self.make_cart
#         temp = Cart.find_by(user_id: self.id)
#         id_item = Item.find_by(item: item)
#         temp.item_id = id_item
#         self.add_cart
#     else
#         temp = Cart.find_by(user_id: self.id)
#         id_item = Item.find_by(item: item)
#         temp.item_id = id_item
#         self.add_cart
#     end
# end