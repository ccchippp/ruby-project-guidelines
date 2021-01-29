class User < ActiveRecord::Base
    has_many :carts
    has_many :items, through: :carts

    def my_cart
        self.carts.collect {|i| i.items}
    end
end