class User < ActiveRecord::Base
    has_many :carts
    has_many :items, through: :carts

    def my_cart
        self.carts.collect {|i| i.items}
    end

    def add_item(product)
        self.carts.first << product
    end

    # def create_order(cart)

    # end

    def self.display_all_users
        all = User.all
        x = 0
        all.length.times do
            puts "Customer #{x+1}:=>> #{all[x].username}"
            x += 1
        end
    end

end