class Item < ActiveRecord::Base
    belongs_to :cart

    # attr_accessor :item, :price
    # def initialize(item, price)
    #     @item = item
    #     @price = price
    # end

end