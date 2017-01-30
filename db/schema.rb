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

ActiveRecord::Schema.define(version: 20170130100351) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bids", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "user_id"
    t.boolean  "auto",          default: false
    t.integer  "increment_by",  default: 0
    t.integer  "max_value",     default: 0
    t.datetime "end_auto_date"
    t.integer  "value"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "start_value"
    t.boolean  "active",        default: true
    t.index ["product_id"], name: "index_bids_on_product_id", using: :btree
    t.index ["user_id"], name: "index_bids_on_user_id", using: :btree
  end

  create_table "products", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.text     "description"
    t.string   "picture_url"
    t.boolean  "for_sale"
    t.integer  "user_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "start_value"
    t.integer  "max_value"
    t.datetime "end_bid_date"
    t.integer  "bid_batch",    default: 0
    t.integer  "value"
    t.index ["user_id"], name: "index_products_on_user_id", using: :btree
  end

  create_table "ratings", force: :cascade do |t|
    t.string   "rateable_type"
    t.integer  "rateable_id"
    t.integer  "value"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.text     "comment"
    t.index ["user_id"], name: "index_ratings_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "pseudonym"
    t.string   "role",             default: "user"
    t.string   "email",                             null: false
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "token"
    t.integer  "vote"
    t.integer  "credits",          default: 0
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

  add_foreign_key "bids", "products"
  add_foreign_key "bids", "users"
  add_foreign_key "products", "users"
  add_foreign_key "ratings", "users"
end
