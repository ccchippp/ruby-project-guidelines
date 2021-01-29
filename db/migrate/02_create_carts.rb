class CreateCarts < ActiveRecord::Migration[6.1]
    def change
      create_table :carts do |t|
        t.integer :user_id
        t.integer :orders_id
      end
    end
  end