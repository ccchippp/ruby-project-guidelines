class Item < ActiveRecord::Base
    belongs_to :cart
    has_many :users, through: :carts

    def self.newest_item
       newnew = Item.all.last.item
       "The newest item added to the shop is #{newnew}!"
    end

    def self.display_all_items
        all = Item.all
        x = 0
        all.length.times do
            temp = all[x]
            puts "Item:  #{temp.item} == Price? $#{temp.price} "
            x += 1
        end
    end

end