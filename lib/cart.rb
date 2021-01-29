class Cart < ActiveRecord::Base
    belongs_to :user
    has_many :items

<<<<<<< HEAD
=======
    def <<(item)
        items << item
    end
    # syntactic sugar ;)
    
>>>>>>> e84402459d10a9063fc4deb1f63a2b22a011e409
    def total_price
        self.items.map(&:price).inject(:+)
    end

<<<<<<< HEAD
    def item_count
        self.items.count
    end
=======
    # Counts the number of items in a cart
    def item_count
        self.items.count
    end

>>>>>>> e84402459d10a9063fc4deb1f63a2b22a011e409
end