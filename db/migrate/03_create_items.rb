class CreateItems < ActiveRecord::Migration[6.1]
    def change
      create_table :items do |t|
        t.belongs_to :cart
        t.string :item
        t.float :price
      end
    end
  end