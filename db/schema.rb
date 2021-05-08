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

ActiveRecord::Schema.define(version: 2021_05_06_153618) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "product_reviews", force: :cascade do |t|
    t.integer "product_id", null: false
    t.integer "user_id", null: false
    t.text "content", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_product_reviews_on_product_id"
    t.index ["user_id"], name: "index_product_reviews_on_user_id"
  end

  create_table "product_stocks", force: :cascade do |t|
    t.integer "product_id", null: false
    t.integer "shop_id", null: false
    t.integer "amount", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_product_stocks_on_product_id"
    t.index ["shop_id"], name: "index_product_stocks_on_shop_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name", limit: 200, null: false
    t.integer "unit_price", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "purchases", force: :cascade do |t|
    t.integer "product_id", null: false
    t.integer "user_id", null: false
    t.integer "shop_id", null: false
    t.integer "unit_price", null: false
    t.integer "amount", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_purchases_on_product_id"
    t.index ["shop_id"], name: "index_purchases_on_shop_id"
    t.index ["user_id"], name: "index_purchases_on_user_id"
  end

  create_table "shops", force: :cascade do |t|
    t.string "name", limit: 100, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name", limit: 200, null: false
    t.string "email", limit: 1000, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "product_reviews", "products"
  add_foreign_key "product_reviews", "users"
  add_foreign_key "product_stocks", "products"
  add_foreign_key "product_stocks", "shops"
  add_foreign_key "purchases", "products"
  add_foreign_key "purchases", "shops"
  add_foreign_key "purchases", "users"
end
