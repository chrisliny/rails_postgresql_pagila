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

ActiveRecord::Schema.define(version: 20150301054425) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "adminpack"

  create_table "actor", primary_key: "actor_id", force: :cascade do |t|
    t.string   "first_name",  limit: 45,                                 null: false
    t.string   "last_name",   limit: 45,                                 null: false
    t.datetime "last_update",            default: '2015-02-08 20:32:53', null: false
  end

  add_index "actor", ["last_name"], name: "idx_actor_last_name", using: :btree

  create_table "address", primary_key: "address_id", force: :cascade do |t|
    t.string   "address",     limit: 50,                                 null: false
    t.string   "address2",    limit: 50
    t.string   "district",    limit: 20,                                 null: false
    t.integer  "city_id",     limit: 2,                                  null: false
    t.string   "postal_code", limit: 10
    t.string   "phone",       limit: 20,                                 null: false
    t.datetime "last_update",            default: '2015-02-08 20:32:53', null: false
  end

  add_index "address", ["city_id"], name: "idx_fk_city_id", using: :btree

  create_table "answers", force: :cascade do |t|
    t.string   "content"
    t.integer  "question_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "answers", ["question_id"], name: "index_answers_on_question_id", using: :btree

  create_table "category", primary_key: "category_id", force: :cascade do |t|
    t.string   "name",        limit: 25,                                 null: false
    t.datetime "last_update",            default: '2015-02-08 20:32:53', null: false
  end

  create_table "city", primary_key: "city_id", force: :cascade do |t|
    t.string   "city",        limit: 50,                                 null: false
    t.integer  "country_id",  limit: 2,                                  null: false
    t.datetime "last_update",            default: '2015-02-08 20:32:53', null: false
  end

  add_index "city", ["country_id"], name: "idx_fk_country_id", using: :btree

  create_table "country", primary_key: "country_id", force: :cascade do |t|
    t.string   "country",     limit: 50,                                 null: false
    t.datetime "last_update",            default: '2015-02-08 20:32:53', null: false
  end

  create_table "customer", primary_key: "customer_id", force: :cascade do |t|
    t.integer  "store_id",    limit: 2,                                  null: false
    t.string   "first_name",  limit: 45,                                 null: false
    t.string   "last_name",   limit: 45,                                 null: false
    t.string   "email",       limit: 50
    t.integer  "address_id",  limit: 2,                                  null: false
    t.boolean  "activebool",             default: true,                  null: false
    t.date     "create_date",                                            null: false
    t.datetime "last_update",            default: '2015-02-08 20:32:53'
    t.integer  "active"
  end

  add_index "customer", ["address_id"], name: "idx_fk_address_id", using: :btree
  add_index "customer", ["last_name"], name: "idx_last_name", using: :btree
  add_index "customer", ["store_id"], name: "idx_fk_store_id", using: :btree

  create_table "film", primary_key: "film_id", force: :cascade do |t|
    t.string   "title",                limit: 255,                                                         null: false
    t.text     "description"
    t.integer  "release_year"
    t.integer  "language_id",          limit: 2,                                                           null: false
    t.integer  "original_language_id", limit: 2
    t.integer  "rental_duration",      limit: 2,                           default: 3,                     null: false
    t.decimal  "rental_rate",                      precision: 4, scale: 2, default: 4.99,                  null: false
    t.integer  "length",               limit: 2
    t.decimal  "replacement_cost",                 precision: 5, scale: 2, default: 19.99,                 null: false
    t.string   "rating",               limit: 32,                          default: "G"
    t.datetime "last_update",                                              default: '2015-02-08 20:32:53', null: false
    t.text     "special_features",                                                                                      array: true
    t.tsvector "fulltext",                                                                                 null: false
  end

  add_index "film", ["fulltext"], name: "film_fulltext_idx", using: :gist
  add_index "film", ["language_id"], name: "idx_fk_language_id", using: :btree
  add_index "film", ["original_language_id"], name: "idx_fk_original_language_id", using: :btree
  add_index "film", ["title"], name: "idx_title", using: :btree

  create_table "film_actor", primary_key: "actor_id", force: :cascade do |t|
    t.integer  "film_id",     limit: 2,                                 null: false
    t.datetime "last_update",           default: '2015-02-08 20:32:53', null: false
  end

  add_index "film_actor", ["film_id"], name: "idx_fk_film_id", using: :btree

  create_table "film_category", primary_key: "film_id", force: :cascade do |t|
    t.integer  "category_id", limit: 2,                                 null: false
    t.datetime "last_update",           default: '2015-02-08 20:32:53', null: false
  end

  create_table "inventory", primary_key: "inventory_id", force: :cascade do |t|
    t.integer  "film_id",     limit: 2,                                 null: false
    t.integer  "store_id",    limit: 2,                                 null: false
    t.datetime "last_update",           default: '2015-02-08 20:32:53', null: false
  end

  add_index "inventory", ["store_id", "film_id"], name: "idx_store_id_film_id", using: :btree

  create_table "language", primary_key: "language_id", force: :cascade do |t|
    t.string   "name",        limit: 20,                                 null: false
    t.datetime "last_update",            default: '2015-02-08 20:32:53', null: false
  end

  create_table "payment", primary_key: "payment_id", force: :cascade do |t|
    t.integer  "customer_id",  limit: 2,                         null: false
    t.integer  "staff_id",     limit: 2,                         null: false
    t.integer  "rental_id",                                      null: false
    t.decimal  "amount",                 precision: 5, scale: 2, null: false
    t.datetime "payment_date",                                   null: false
  end

  add_index "payment", ["customer_id"], name: "idx_fk_customer_id", using: :btree
  add_index "payment", ["staff_id"], name: "idx_fk_staff_id", using: :btree

  create_table "payment_p2007_01", id: false, force: :cascade do |t|
    t.integer  "payment_id",                                     default: 0, null: false
    t.integer  "customer_id",  limit: 2,                                     null: false
    t.integer  "staff_id",     limit: 2,                                     null: false
    t.integer  "rental_id",                                                  null: false
    t.decimal  "amount",                 precision: 5, scale: 2,             null: false
    t.datetime "payment_date",                                               null: false
  end

  add_index "payment_p2007_01", ["customer_id"], name: "idx_fk_payment_p2007_01_customer_id", using: :btree
  add_index "payment_p2007_01", ["staff_id"], name: "idx_fk_payment_p2007_01_staff_id", using: :btree

  create_table "payment_p2007_02", id: false, force: :cascade do |t|
    t.integer  "payment_id",                                     default: 0, null: false
    t.integer  "customer_id",  limit: 2,                                     null: false
    t.integer  "staff_id",     limit: 2,                                     null: false
    t.integer  "rental_id",                                                  null: false
    t.decimal  "amount",                 precision: 5, scale: 2,             null: false
    t.datetime "payment_date",                                               null: false
  end

  add_index "payment_p2007_02", ["customer_id"], name: "idx_fk_payment_p2007_02_customer_id", using: :btree
  add_index "payment_p2007_02", ["staff_id"], name: "idx_fk_payment_p2007_02_staff_id", using: :btree

  create_table "payment_p2007_03", id: false, force: :cascade do |t|
    t.integer  "payment_id",                                     default: 0, null: false
    t.integer  "customer_id",  limit: 2,                                     null: false
    t.integer  "staff_id",     limit: 2,                                     null: false
    t.integer  "rental_id",                                                  null: false
    t.decimal  "amount",                 precision: 5, scale: 2,             null: false
    t.datetime "payment_date",                                               null: false
  end

  add_index "payment_p2007_03", ["customer_id"], name: "idx_fk_payment_p2007_03_customer_id", using: :btree
  add_index "payment_p2007_03", ["staff_id"], name: "idx_fk_payment_p2007_03_staff_id", using: :btree

  create_table "payment_p2007_04", id: false, force: :cascade do |t|
    t.integer  "payment_id",                                     default: 0, null: false
    t.integer  "customer_id",  limit: 2,                                     null: false
    t.integer  "staff_id",     limit: 2,                                     null: false
    t.integer  "rental_id",                                                  null: false
    t.decimal  "amount",                 precision: 5, scale: 2,             null: false
    t.datetime "payment_date",                                               null: false
  end

  add_index "payment_p2007_04", ["customer_id"], name: "idx_fk_payment_p2007_04_customer_id", using: :btree
  add_index "payment_p2007_04", ["staff_id"], name: "idx_fk_payment_p2007_04_staff_id", using: :btree

  create_table "payment_p2007_05", id: false, force: :cascade do |t|
    t.integer  "payment_id",                                     default: 0, null: false
    t.integer  "customer_id",  limit: 2,                                     null: false
    t.integer  "staff_id",     limit: 2,                                     null: false
    t.integer  "rental_id",                                                  null: false
    t.decimal  "amount",                 precision: 5, scale: 2,             null: false
    t.datetime "payment_date",                                               null: false
  end

  add_index "payment_p2007_05", ["customer_id"], name: "idx_fk_payment_p2007_05_customer_id", using: :btree
  add_index "payment_p2007_05", ["staff_id"], name: "idx_fk_payment_p2007_05_staff_id", using: :btree

  create_table "payment_p2007_06", id: false, force: :cascade do |t|
    t.integer  "payment_id",                                     default: 0, null: false
    t.integer  "customer_id",  limit: 2,                                     null: false
    t.integer  "staff_id",     limit: 2,                                     null: false
    t.integer  "rental_id",                                                  null: false
    t.decimal  "amount",                 precision: 5, scale: 2,             null: false
    t.datetime "payment_date",                                               null: false
  end

  add_index "payment_p2007_06", ["customer_id"], name: "idx_fk_payment_p2007_06_customer_id", using: :btree
  add_index "payment_p2007_06", ["staff_id"], name: "idx_fk_payment_p2007_06_staff_id", using: :btree

  create_table "questions", force: :cascade do |t|
    t.text     "content"
    t.integer  "survey_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rental", primary_key: "rental_id", force: :cascade do |t|
    t.datetime "rental_date",                                            null: false
    t.integer  "inventory_id",                                           null: false
    t.integer  "customer_id",  limit: 2,                                 null: false
    t.datetime "return_date"
    t.integer  "staff_id",     limit: 2,                                 null: false
    t.datetime "last_update",            default: '2015-02-08 20:32:53', null: false
  end

  add_index "rental", ["inventory_id"], name: "idx_fk_inventory_id", using: :btree
  add_index "rental", ["rental_date", "inventory_id", "customer_id"], name: "idx_unq_rental_rental_date_inventory_id_customer_id", unique: true, using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.string   "ancestry"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "roles", ["ancestry"], name: "index_roles_on_ancestry", using: :btree

  create_table "staff", primary_key: "staff_id", force: :cascade do |t|
    t.string   "first_name",  limit: 45,                                 null: false
    t.string   "last_name",   limit: 45,                                 null: false
    t.integer  "address_id",  limit: 2,                                  null: false
    t.string   "email",       limit: 50
    t.integer  "store_id",    limit: 2,                                  null: false
    t.boolean  "active",                 default: true,                  null: false
    t.string   "username",    limit: 16,                                 null: false
    t.string   "password",    limit: 40
    t.datetime "last_update",            default: '2015-02-08 20:32:53', null: false
    t.binary   "picture"
  end

  create_table "store", primary_key: "store_id", force: :cascade do |t|
    t.integer  "manager_staff_id", limit: 2,                                 null: false
    t.integer  "address_id",       limit: 2,                                 null: false
    t.datetime "last_update",                default: '2015-02-08 20:32:53', null: false
  end

  add_index "store", ["manager_staff_id"], name: "idx_unq_manager_staff_id", unique: true, using: :btree

  create_table "surveys", force: :cascade do |t|
    t.string   "name"
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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "role_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["role_id"], name: "index_users_on_role_id", using: :btree

  add_foreign_key "address", "city", primary_key: "city_id", name: "address_city_id_fkey", on_update: :cascade, on_delete: :restrict
  add_foreign_key "answers", "questions"
  add_foreign_key "city", "country", primary_key: "country_id", name: "city_country_id_fkey", on_update: :cascade, on_delete: :restrict
  add_foreign_key "customer", "address", primary_key: "address_id", name: "customer_address_id_fkey", on_update: :cascade, on_delete: :restrict
  add_foreign_key "customer", "store", primary_key: "store_id", name: "customer_store_id_fkey", on_update: :cascade, on_delete: :restrict
  add_foreign_key "film", "language", column: "original_language_id", primary_key: "language_id", name: "film_original_language_id_fkey", on_update: :cascade, on_delete: :restrict
  add_foreign_key "film", "language", primary_key: "language_id", name: "film_language_id_fkey", on_update: :cascade, on_delete: :restrict
  add_foreign_key "film_actor", "actor", primary_key: "actor_id", name: "film_actor_actor_id_fkey", on_update: :cascade, on_delete: :restrict
  add_foreign_key "film_actor", "film", primary_key: "film_id", name: "film_actor_film_id_fkey", on_update: :cascade, on_delete: :restrict
  add_foreign_key "film_category", "category", primary_key: "category_id", name: "film_category_category_id_fkey", on_update: :cascade, on_delete: :restrict
  add_foreign_key "film_category", "film", primary_key: "film_id", name: "film_category_film_id_fkey", on_update: :cascade, on_delete: :restrict
  add_foreign_key "inventory", "film", primary_key: "film_id", name: "inventory_film_id_fkey", on_update: :cascade, on_delete: :restrict
  add_foreign_key "inventory", "store", primary_key: "store_id", name: "inventory_store_id_fkey", on_update: :cascade, on_delete: :restrict
  add_foreign_key "payment", "customer", primary_key: "customer_id", name: "payment_customer_id_fkey", on_update: :cascade, on_delete: :restrict
  add_foreign_key "payment", "rental", primary_key: "rental_id", name: "payment_rental_id_fkey", on_update: :cascade, on_delete: :nullify
  add_foreign_key "payment", "staff", primary_key: "staff_id", name: "payment_staff_id_fkey", on_update: :cascade, on_delete: :restrict
  add_foreign_key "payment_p2007_01", "customer", primary_key: "customer_id", name: "payment_p2007_01_customer_id_fkey"
  add_foreign_key "payment_p2007_01", "rental", primary_key: "rental_id", name: "payment_p2007_01_rental_id_fkey"
  add_foreign_key "payment_p2007_01", "staff", primary_key: "staff_id", name: "payment_p2007_01_staff_id_fkey"
  add_foreign_key "payment_p2007_02", "customer", primary_key: "customer_id", name: "payment_p2007_02_customer_id_fkey"
  add_foreign_key "payment_p2007_02", "rental", primary_key: "rental_id", name: "payment_p2007_02_rental_id_fkey"
  add_foreign_key "payment_p2007_02", "staff", primary_key: "staff_id", name: "payment_p2007_02_staff_id_fkey"
  add_foreign_key "payment_p2007_03", "customer", primary_key: "customer_id", name: "payment_p2007_03_customer_id_fkey"
  add_foreign_key "payment_p2007_03", "rental", primary_key: "rental_id", name: "payment_p2007_03_rental_id_fkey"
  add_foreign_key "payment_p2007_03", "staff", primary_key: "staff_id", name: "payment_p2007_03_staff_id_fkey"
  add_foreign_key "payment_p2007_04", "customer", primary_key: "customer_id", name: "payment_p2007_04_customer_id_fkey"
  add_foreign_key "payment_p2007_04", "rental", primary_key: "rental_id", name: "payment_p2007_04_rental_id_fkey"
  add_foreign_key "payment_p2007_04", "staff", primary_key: "staff_id", name: "payment_p2007_04_staff_id_fkey"
  add_foreign_key "payment_p2007_05", "customer", primary_key: "customer_id", name: "payment_p2007_05_customer_id_fkey"
  add_foreign_key "payment_p2007_05", "rental", primary_key: "rental_id", name: "payment_p2007_05_rental_id_fkey"
  add_foreign_key "payment_p2007_05", "staff", primary_key: "staff_id", name: "payment_p2007_05_staff_id_fkey"
  add_foreign_key "payment_p2007_06", "customer", primary_key: "customer_id", name: "payment_p2007_06_customer_id_fkey"
  add_foreign_key "payment_p2007_06", "rental", primary_key: "rental_id", name: "payment_p2007_06_rental_id_fkey"
  add_foreign_key "payment_p2007_06", "staff", primary_key: "staff_id", name: "payment_p2007_06_staff_id_fkey"
  add_foreign_key "rental", "customer", primary_key: "customer_id", name: "rental_customer_id_fkey", on_update: :cascade, on_delete: :restrict
  add_foreign_key "rental", "inventory", primary_key: "inventory_id", name: "rental_inventory_id_fkey", on_update: :cascade, on_delete: :restrict
  add_foreign_key "rental", "staff", primary_key: "staff_id", name: "rental_staff_id_fkey", on_update: :cascade, on_delete: :restrict
  add_foreign_key "staff", "address", primary_key: "address_id", name: "staff_address_id_fkey", on_update: :cascade, on_delete: :restrict
  add_foreign_key "staff", "store", primary_key: "store_id", name: "staff_store_id_fkey"
  add_foreign_key "store", "address", primary_key: "address_id", name: "store_address_id_fkey", on_update: :cascade, on_delete: :restrict
  add_foreign_key "store", "staff", column: "manager_staff_id", primary_key: "staff_id", name: "store_manager_staff_id_fkey", on_update: :cascade, on_delete: :restrict
end
