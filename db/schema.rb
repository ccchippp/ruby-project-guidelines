# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 4) do

  create_table "carts", force: :cascade do |t|
    t.integer "user_id"
<<<<<<< HEAD
=======
    t.integer "item_id"
>>>>>>> e84402459d10a9063fc4deb1f63a2b22a011e409
  end

  create_table "items", force: :cascade do |t|
    t.integer "cart_id"
    t.string "item"
    t.float "price"
    t.index ["cart_id"], name: "index_items_on_cart_id"
  end

  create_table "orders", force: :cascade do |t|
    t.boolean "processed"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
  end

end
