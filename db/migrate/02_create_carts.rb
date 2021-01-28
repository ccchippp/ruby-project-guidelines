class CreateCarts < ActiveRecord::Migration[6.1]
    def change
      create_table :carts do |t|
        t.references :user
        t.json :items
      end
    end
  end