class User < ActiveRecord::Base
    has_many :orders
    has_one :cart
    has_many :items, through: :cart

    # @@all = []

    # def initialize(username)
    #     @username = username
    #     @cart = []
    #     User.all.push(self)
    # end

    # def self.all
    #     @@all
    # end

    # def self.all_carts

    # end

end