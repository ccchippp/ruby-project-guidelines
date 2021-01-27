class User < ActiveRecord::Base
    has_many :orders
    has_one :cart
    has_many :items, through: :cart

    # this doesn't work
    # def add_item_to_cart(:item)
    #     self.cart = self.cart << :item
    # end
end