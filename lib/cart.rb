class Cart < ActiveRecord::Base
    belongs_to :user
    has_many :items

    # def <<(item)
    #     items << item
    # end
    # syntactic sugar
    def total_price
        self.items.map(&:price).inject(:+)
    end
end