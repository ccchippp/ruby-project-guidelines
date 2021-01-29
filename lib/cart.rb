class Cart < ActiveRecord::Base
    belongs_to :user
    has_many :items

    def total_price
        self.items.map(&:price).inject(:+)
    end

    def item_count
        self.items.count
    end
end