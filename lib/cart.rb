class Cart < ActiveRecord::Base
    has_many :items, :user

    #attr_accessor :user_id, :item_id
    
    # def total_price
    #     items.to_a_sum { |i| i.price}
    # end
    
end