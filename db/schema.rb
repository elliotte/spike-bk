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

ActiveRecord::Schema.define(version: 20160715103249) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "ledgers", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.uuid     "user_id"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type"
    t.string   "user_tag"
    t.decimal  "opening_balance"
  end

  add_index "ledgers", ["user_id"], name: "index_ledgers_on_user_id", using: :btree

  create_table "transaction", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.uuid     "ledger_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "amount"
    t.decimal  "tax",              default: 0.0
    t.datetime "acc_date"
    t.string   "bank_description"
    t.string   "type"
    t.string   "tb_mapping"
  end

  add_index "transaction", ["ledger_id"], name: "index_transaction_on_ledger_id", using: :btree

  create_table "transactions", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.uuid     "ledger_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "amount"
    t.decimal  "tax",              default: 0.0
    t.datetime "acc_date"
    t.string   "bank_description"
    t.string   "type"
    t.string   "tb_mapping"
  end

  add_index "transactions", ["ledger_id"], name: "index_transactions_on_ledger_id", using: :btree

  create_table "users", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
