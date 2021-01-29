class CreateCarts < ActiveRecord::Migration[6.1]
    def change
      create_table :carts do |t|
        t.integer :user
        t.integer :items
      end
    end
  end