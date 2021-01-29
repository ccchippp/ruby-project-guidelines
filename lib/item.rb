class Item < ActiveRecord::Base
<<<<<<< HEAD
    belongs_to :carts
=======
    belongs_to :cart
>>>>>>> e84402459d10a9063fc4deb1f63a2b22a011e409
    has_many :users, through: :carts

    def self.newest_item
       newnew = Item.all.last.item
       "The newest item added to the shop is #{newnew}!"
    end
<<<<<<< HEAD

    def self.display_all_items
        all = Item.all
        x = 0
        all.length.times do
            temp = all[x]
            puts "Item:  #{temp.item} == Price? $#{temp.price} "
            x += 1
        end
    end

=======
>>>>>>> e84402459d10a9063fc4deb1f63a2b22a011e409
end