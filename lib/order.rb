class Order < ActiveRecord::Base
<<<<<<< HEAD
    belongs_to :user
    has_many :items, through: :cart
=======
    # belongs_to :user
    # has_many :items, through: :cart
>>>>>>> e84402459d10a9063fc4deb1f63a2b22a011e409
end