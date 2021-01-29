class Item < ActiveRecord::Base
    belongs_to :cart
    has_many :users, through: :carts

    def self.newest_item
       newnew = Item.all.last.item
       "The newest item added to the shop is #{newnew}!"
    end
end