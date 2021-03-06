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

ActiveRecord::Schema.define(version: 20190506154838) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "distributors", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inventories", force: :cascade do |t|
    t.integer  "quantity"
    t.integer  "quantity_needed"
    t.integer  "order_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "store_id"
    t.integer  "store_good_id"
    t.boolean  "out_of_stock"
    t.boolean  "verified"
    t.string   "corrective_action"
  end

  create_table "locations", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "store_id"
    t.integer  "row_num"
  end

  create_table "orders", force: :cascade do |t|
    t.string   "status"
    t.string   "order_day"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.text     "message"
    t.integer  "store_id"
    t.boolean  "paid"
    t.decimal  "sale_total", precision: 6, scale: 2
  end

  create_table "prepcenter_products", force: :cascade do |t|
    t.string   "name"
    t.string   "measurement"
    t.string   "item_type"
    t.decimal  "portion_size",  precision: 6, scale: 2
    t.integer  "product_id"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "case_quantity"
  end

  create_table "prices", force: :cascade do |t|
    t.decimal  "amount"
    t.integer  "product_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "saved_price_id"
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.string   "measurement"
    t.string   "item_type"
    t.integer  "case_quantity"
    t.decimal  "price"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.decimal  "markup"
    t.string   "distributor"
  end

  create_table "quick_products", force: :cascade do |t|
    t.string   "name"
    t.string   "measurement"
    t.integer  "quantity_needed"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "store_id"
  end

  create_table "saved_prices", force: :cascade do |t|
    t.string   "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "store_goods", force: :cascade do |t|
    t.integer  "store_id"
    t.integer  "product_id"
    t.integer  "location_id"
    t.integer  "distributor_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "max_amount"
    t.integer  "prepcenter_product_id"
    t.string   "measurement"
    t.boolean  "replenish_by_each"
    t.string   "delivery_day"
  end

  create_table "stores", force: :cascade do |t|
    t.string   "name"
    t.string   "label"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "role"
    t.string   "username"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["username"], name: "index_users_on_username", unique: true, using: :btree
  end

end
