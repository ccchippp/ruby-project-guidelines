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

    def show_cart
        user_cart = Cart.find_by(user_id: self.id)
        cart_items = user_cart.items
        puts "==================>>Cart<<=================="
        puts "============================================"
        x = 0
        cart_items.length.times do
            puts "Item::  #{cart_items[x].item} ==> Price? #{cart_items[x].price}"
            x += 1
        end
        puts "============================================"
        puts ">>> Total: #{user_cart.total_price}"
        puts "============================================"
        puts "============================================"
    end

    def self.display_all_users
        all = User.all
        x = 0
        all.length.times do
            puts "Customer #{x+1}:=>> #{all[x].username}"
            x += 1
        end
    end

end