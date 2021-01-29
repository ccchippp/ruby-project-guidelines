class Item < ActiveRecord::Base
    belongs_to :carts
    has_many :users, through: :carts
end