class User < ActiveRecord::Base
    has_many :carts
    has_many :items, through: :carts

<<<<<<< HEAD
    def my_cart
        self.carts.collect {|i| i.items}
    end

    def self.display_all_users
        all = User.all
        x = 0
        all.length.times do
            puts "Customer #{x+1}:=>> #{all[x].username}"
            x += 1
        end
    end

=======
    # Users can view their cart's contents
    def my_cart
        self.carts.collect { |i| i.items }
    end
    # Users can add products to their cart
    def add_item(product)
        self.carts.first << product
    end

    # def remove_item(product)
    #     trash = self.carts.select { |i| i.items == product }
    #     if trash != nil 
    #         self.carts.select { |i| i.items == trash }.delete
    #         end
    # end




>>>>>>> e84402459d10a9063fc4deb1f63a2b22a011e409
end