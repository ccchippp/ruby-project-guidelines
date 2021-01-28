class User < ActiveRecord::Base
    has_many :orders
    has_one :cart
    has_many :items, through: :cart

    attr_accessor :name

    def initialize(name)
        @name = name
    end

end