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

ActiveRecord::Schema.define(version: 20150820214351) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "groups", ["name"], name: "index_groups_on_name", unique: true, using: :btree

  create_table "tds_requests", force: :cascade do |t|
    t.integer  "user_id",                        null: false
    t.integer  "toilet_id",                      null: false
    t.string   "state",      default: "pending", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tds_requests", ["toilet_id"], name: "index_tds_requests_on_toilet_id", using: :btree
  add_index "tds_requests", ["user_id"], name: "index_tds_requests_on_user_id", using: :btree

  create_table "toilet_transactions", force: :cascade do |t|
    t.integer  "toilet_id",             null: false
    t.string   "event",      limit: 16
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "toilet_transactions", ["toilet_id", "created_at"], name: "index_toilet_transactions_on_toilet_id_and_created_at", using: :btree

  create_table "toilets", force: :cascade do |t|
    t.integer  "group_id",                                            null: false
    t.string   "state",              limit: 32, default: "available", null: false
    t.string   "name",                                                null: false
    t.string   "description"
    t.string   "gender",             limit: 1,  default: "M",         null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "last_keep_alive_at"
  end

  add_index "toilets", ["group_id", "state"], name: "idx_toilets_group_status", using: :btree

  create_table "users", force: :cascade do |t|
    t.integer  "group_id",                             null: false
    t.string   "email",                                null: false
    t.string   "encrypted_password",     default: "",  null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,   null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "unconfirmed_email"
    t.string   "auth_token",                           null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "gender",                 default: "M", null: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "users", ["auth_token"], name: "index_users_on_auth_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["group_id"], name: "index_users_on_group_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
