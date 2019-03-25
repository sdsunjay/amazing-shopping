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

ActiveRecord::Schema.define(version: 2019_03_21_020302) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "inventories", force: :cascade do |t|
    t.bigint "product_id"
    t.integer "quantity"
    t.string "color"
    t.string "size"
    t.integer "weight", limit: 2
    t.integer "price_cents"
    t.integer "sale_price_cents"
    t.integer "cost_cents"
    t.string "sku"
    t.integer "length", limit: 2
    t.integer "width", limit: 2
    t.integer "height", limit: 2
    t.string "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_inventories_on_product_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "inventory_id"
    t.string "street_address"
    t.string "apartment"
    t.string "city"
    t.string "state"
    t.string "country_code"
    t.integer "zip"
    t.string "phone_number"
    t.string "email"
    t.string "name"
    t.string "status"
    t.string "payment_ref"
    t.string "transaction_id"
    t.integer "payment_amt_cents"
    t.integer "ship_charged_cents"
    t.integer "ship_cost_cents"
    t.integer "subtotal_cents"
    t.integer "total_cents"
    t.string "shipper_name"
    t.datetime "payment_date"
    t.datetime "shipped_date"
    t.string "tracking_number"
    t.integer "tax_total_cents"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["inventory_id"], name: "index_orders_on_inventory_id"
    t.index ["product_id"], name: "index_orders_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.text "description"
    t.string "style"
    t.string "brand"
    t.string "url"
    t.integer "product_type", limit: 2, default: 0, null: false
    t.decimal "shipping_price"
    t.string "note"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_products_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.boolean "superadmin", default: false
    t.string "shop_name", default: ""
    t.string "card_brand", default: ""
    t.integer "card_last_four", limit: 2
    t.datetime "trial_ends_at"
    t.string "shop_domain"
    t.boolean "is_enabled", default: true
    t.string "billing_plan"
    t.datetime "trial_starts_at"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "inventories", "products"
  add_foreign_key "orders", "inventories"
  add_foreign_key "orders", "products"
  add_foreign_key "products", "users"
end
