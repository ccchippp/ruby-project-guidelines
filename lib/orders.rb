class Orders < ActiveRecord::Base
    has_many :carts
    has_many :users, through: :carts
    has_many :items, through: :carts

    def self.display_all_orders
        all_orders = Orders.all
        x = 0
        all_orders.length.times do
            temp = all_orders[x].carts
            if temp != []
                user = User.find_by(id: temp[0].user_id)
                cart_items = temp[0].items
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
            end
            x += 1
        end
    end


    def <<(cart)
        carts << cart
    end

end