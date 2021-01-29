require_relative '../config/environment'

#User.destroy_all
Cart.destroy_all
Item.destroy_all

NotAmazon.open_store
