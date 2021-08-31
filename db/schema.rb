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

ActiveRecord::Schema.define(version: 2021_08_24_161831) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "food_items", force: :cascade do |t|
    t.string "destription"
    t.float "price"
    t.string "title"
    t.bigint "order_id"
    t.bigint "resturant_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "quantity"
    t.index ["order_id"], name: "index_food_items_on_order_id"
    t.index ["resturant_id"], name: "index_food_items_on_resturant_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.integer "quantity"
    t.boolean "delivered"
    t.float "sub_total"
    t.bigint "user_id"
    t.bigint "resturant_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["resturant_id"], name: "index_orders_on_resturant_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "resturants", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "resturants_users", id: false, force: :cascade do |t|
    t.bigint "resturant_id", null: false
    t.bigint "user_id", null: false
    t.index ["resturant_id", "user_id"], name: "index_resturants_users_on_resturant_id_and_user_id"
    t.index ["user_id", "resturant_id"], name: "index_resturants_users_on_user_id_and_resturant_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone_number"
    t.string "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
