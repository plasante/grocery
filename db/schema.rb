# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140719124151) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "brands", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "grocery_list_items", force: true do |t|
    t.integer  "grocery_list_id"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "grocery_list_items", ["grocery_list_id"], name: "index_grocery_list_items_on_grocery_list_id", using: :btree
  add_index "grocery_list_items", ["product_id"], name: "index_grocery_list_items_on_product_id", using: :btree

  create_table "grocery_lists", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.integer  "brand_id"
    t.text     "description"
    t.integer  "categorizable_id"
    t.string   "categorizable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "products", ["brand_id"], name: "index_products_on_brand_id", using: :btree
  add_index "products", ["categorizable_id", "categorizable_type"], name: "index_products_on_categorizable_id_and_categorizable_type", using: :btree

  create_table "retailers", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "no"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "country",    limit: 50
    t.string   "zip",        limit: 15
    t.string   "latitude"
    t.string   "longitude"
  end

  create_table "retailers_products", id: false, force: true do |t|
    t.integer "retailer_id"
    t.integer "product_id"
    t.decimal "price",       precision: 8, scale: 2
  end

  add_index "retailers_products", ["product_id", "retailer_id"], name: "index_retailers_products_on_product_id_and_retailer_id", using: :btree
  add_index "retailers_products", ["retailer_id", "product_id"], name: "index_retailers_products_on_retailer_id_and_product_id", using: :btree

  create_table "sub_categories", force: true do |t|
    t.string   "name"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sub_categories", ["category_id"], name: "index_sub_categories_on_category_id", using: :btree

  create_table "sub_sub_categories", force: true do |t|
    t.string   "name"
    t.integer  "sub_category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sub_sub_categories", ["sub_category_id"], name: "index_sub_sub_categories_on_sub_category_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "similar_allowed", default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

end
