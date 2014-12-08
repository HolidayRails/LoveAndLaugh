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

ActiveRecord::Schema.define(version: 20131201195027791) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "unaccent"

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "businesses", force: true do |t|
    t.integer "user_id"
    t.string  "name"
    t.string  "email"
    t.string  "phone"
    t.string  "fb_url"
    t.string  "currency"
    t.string  "slug"
  end

  add_index "businesses", ["slug"], name: "index_businesses_on_slug", unique: true, using: :btree
  add_index "businesses", ["user_id"], name: "index_businesses_on_user_id", using: :btree

  create_table "deal_shop_assocs", force: true do |t|
    t.integer "deal_id"
    t.integer "shop_id"
  end

  add_index "deal_shop_assocs", ["deal_id"], name: "index_deal_shop_assocs_on_deal_id", using: :btree
  add_index "deal_shop_assocs", ["shop_id"], name: "index_deal_shop_assocs_on_shop_id", using: :btree

  create_table "deals", force: true do |t|
    t.string   "title"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "item_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "friendly_id_slugs", force: true do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "item_shop_assocs", force: true do |t|
    t.integer "item_id"
    t.integer "shop_id"
  end

  add_index "item_shop_assocs", ["item_id", "shop_id"], name: "index_item_shop_assocs_on_item_id_and_shop_id", using: :btree
  add_index "item_shop_assocs", ["item_id"], name: "index_item_shop_assocs_on_item_id", using: :btree
  add_index "item_shop_assocs", ["shop_id"], name: "index_item_shop_assocs_on_shop_id", using: :btree

  create_table "items", force: true do |t|
    t.string   "name"
    t.string   "location"
    t.string   "price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
    t.string   "description",          limit: 1000
    t.string   "buyer_instructions"
    t.string   "quantity_description"
    t.string   "slug"
    t.integer  "business_id"
  end

  add_index "items", ["business_id"], name: "index_items_on_business_id", using: :btree
  add_index "items", ["slug"], name: "index_items_on_slug", unique: true, using: :btree

  create_table "kids", force: true do |t|
    t.string   "name"
    t.string   "age"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "motherFirstName"
    t.string   "motherLastName"
    t.string   "fatherFirstName"
    t.string   "fatherLastName"
    t.string   "address"
    t.string   "phone"
    t.string   "email"
    t.text     "likings"
    t.text     "badHabbits"
    t.text     "words"
    t.string   "specificFood"
    t.string   "allergies"
    t.text     "other"
  end

  create_table "locations", force: true do |t|
    t.string  "addr1"
    t.string  "addr2"
    t.string  "city"
    t.string  "zip"
    t.string  "region_code"
    t.string  "country_code"
    t.integer "locatable_id"
    t.string  "locatable_type"
  end

  add_index "locations", ["locatable_id", "locatable_type"], name: "index_locations_on_locatable_id_and_locatable_type", using: :btree

  create_table "rates", force: true do |t|
    t.integer  "rater_id"
    t.integer  "rateable_id"
    t.string   "rateable_type"
    t.float    "stars",         null: false
    t.string   "dimension"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rates", ["rateable_id", "rateable_type"], name: "index_rates_on_rateable_id_and_rateable_type", using: :btree
  add_index "rates", ["rater_id"], name: "index_rates_on_rater_id", using: :btree

  create_table "rating_caches", force: true do |t|
    t.integer  "cacheable_id"
    t.string   "cacheable_type"
    t.float    "avg",            null: false
    t.integer  "qty",            null: false
    t.string   "dimension"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rating_caches", ["cacheable_id", "cacheable_type"], name: "index_rating_caches_on_cacheable_id_and_cacheable_type", using: :btree

  create_table "shops", force: true do |t|
    t.string  "time_zone"
    t.boolean "delivery"
    t.integer "business_id"
    t.string  "phone"
  end

  add_index "shops", ["business_id"], name: "index_shops_on_business_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "avatar"
    t.string   "bio"
    t.string   "phone"
    t.string   "username"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
