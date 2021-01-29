class User < ActiveRecord::Base
    has_many :carts
    has_many :items, through: :carts

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




end