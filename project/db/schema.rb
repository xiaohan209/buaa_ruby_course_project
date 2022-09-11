# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_01_01_101650) do

  create_table "cart_items", force: :cascade do |t|
    t.integer "user_id"
    t.integer "product_id"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_cart_items_on_product_id"
    t.index ["user_id"], name: "index_cart_items_on_user_id"
  end

  create_table "colors", force: :cascade do |t|
    t.string "rgb"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "designs", force: :cascade do |t|
    t.integer "sales"
    t.string "design_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id"
    t.integer "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_favorites_on_product_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "product_types", force: :cascade do |t|
    t.string "product_type_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "product_name"
    t.integer "design_id"
    t.integer "color_id"
    t.integer "size_id"
    t.decimal "retail_price", precision: 10, scale: 2
    t.integer "favorites"
    t.integer "sales"
    t.string "description"
    t.string "image_directory"
    t.integer "gender"
    t.integer "product_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["color_id"], name: "index_products_on_color_id"
    t.index ["design_id"], name: "index_products_on_design_id"
    t.index ["product_type_id"], name: "index_products_on_product_type_id"
    t.index ["size_id"], name: "index_products_on_size_id"
  end

  create_table "sizes", force: :cascade do |t|
    t.string "size_name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transaction_items", force: :cascade do |t|
    t.integer "user_id"
    t.integer "product_id"
    t.integer "quantity"
    t.decimal "price", precision: 10, scale: 2
    t.integer "transaction_order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_transaction_items_on_product_id"
    t.index ["transaction_order_id"], name: "index_transaction_items_on_transaction_order_id"
    t.index ["user_id"], name: "index_transaction_items_on_user_id"
  end

  create_table "transaction_orders", force: :cascade do |t|
    t.decimal "deal_sum", precision: 10, scale: 2
    t.integer "user_id"
    t.string "delivery_address"
    t.string "delivery_name"
    t.string "delivery_phone"
    t.string "delivery_postcode"
    t.string "order_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_transaction_orders_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "user_name"
    t.integer "user_role"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
