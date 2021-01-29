class User < ActiveRecord::Base
    has_many :carts
    has_many :items, through: :carts

    def item_count
        #return the number of items in a user's cart
        self.carts.items.count
    end

    def my_cart
        self.carts.collect {|i| i.items}
        # stuff = self.carts.collect {|i| i.items}
        # stuff.each do |things|
        #     things.each do |crap|
        #         crap
        #     end
        # end
        # Returns an array inside of an array????
    end

    # def total_price
    #     # my_cart.map(&:price).inject(:+)
    #     # my_cart.sum(&:amount)
    #     Cart.items.map(&:price).inject(:+) #THIS GIVES ME THE TOTAL
    #     #chips_cart.items.map(&:price).inject(:+) THIS GIVES ME THE TOTAL

    #     # chips_cart.items.first.price works  how do I get the price for all items
    # end
end