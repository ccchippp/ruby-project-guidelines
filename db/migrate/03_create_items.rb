class CreateItems < ActiveRecord::Migration[6.1]
    def change
      create_table :items do |t|
        t.string :item
        t.float :price 
        t.integer :quantity
      end
    end
  end