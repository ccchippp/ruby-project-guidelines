class CreateCarts < ActiveRecord::Migration[6.1]
    def change
      create_table :carts do |t|
        t.integer :user_id
<<<<<<< HEAD
=======
        t.integer :item_id
>>>>>>> e84402459d10a9063fc4deb1f63a2b22a011e409
      end
    end
  end