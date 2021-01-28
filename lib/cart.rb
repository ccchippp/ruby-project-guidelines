class Cart < ActiveRecord::Base
    belongs_to :user
    has_many :items

    attr_accessor :user_id, :item_id

    # def total_price
    #     items.to_a_sum { |i| i.price}
    # end
    
end