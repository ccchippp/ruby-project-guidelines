class CreateOrders < ActiveRecord::Migration[5.2]
    def change
      create_table :orders do |t|
        t.boolean :processed 
      end
    end
  end