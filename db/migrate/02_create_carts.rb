class CreateCarts < ActiveRecord::Migration[5.2]
    def change
      create_table :carts do |t|
        t.reference :user
      end
    end
  end