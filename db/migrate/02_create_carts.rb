class CreateCarts < ActiveRecord::Migration[6.1]
    def change
      create_table :carts do |t|
        t.references :user
        serialize :config, Hash
      end
    end
  end

# chip.cart.to_a.map(&:serializable_hash)

# hash = { }
# hash[:a] = 'a'
# hash[:a]
# # => 'a'