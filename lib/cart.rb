class Cart < ActiveRecord::Base
    belongs_to :user
    has_many :items

    def <<(item)
        items << item
    end
    # syntactic sugar ;)
    
    def total_price
        self.items.map(&:price).inject(:+)
    end

    # Counts the number of items in a cart
    def item_count
        self.items.count
    end
    def remove_item(product)
        trash = product.id
        self.items.destroy(trash)
    end
    
    def view_cart
        self.items.collect {|i| i.item}
    end

end