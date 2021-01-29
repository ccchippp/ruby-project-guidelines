class CreateOrders < ActiveRecord::Migration[6.1]
    def change
      create_table :orders do |t|
        t.boolean :processed 
      end
    end
  end