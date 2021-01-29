class Orders < ActiveRecord::Base
    has_many :carts
    has_many :users, through: :carts
    has_many :items, through: :carts

    def self.display_all_orders
        all = Order.all
        x = 0
        all.length.times do
            temp = all[x].carts
            cart = Cart.find_by(user_id: temp[x].user_id)
            user = User.find_by(user_id: temp[x].user_id)
            cart_items = cart.items
            puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
            puts "-------------------------------------"
            puts "#{user.username}'s Order:  "
            puts "-------------------------------------"
            y = 0
            cart_items.length.times do
                puts ">> Item: #{cart_items[y].item} == > Price? #{cart_items[y].price}"
                y += 1
            end
            puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
            x += 1
        end
    end


    def <<(cart)
        carts << cart
    end

end