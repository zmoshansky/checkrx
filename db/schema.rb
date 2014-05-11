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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140511193526) do

  create_table "drugs", :force => true do |t|
    t.integer  "din"
    t.string   "brand_name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "pharmacies", :force => true do |t|
    t.string   "name"
    t.text     "address"
    t.string   "city"
    t.string   "postal_code"
    t.integer  "phone"
    t.string   "email"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "rx_alerts", :force => true do |t|
    t.integer  "din"
    t.string   "brand_name"
    t.string   "generic_name"
    t.integer  "pharmacy_id"
    t.datetime "expected_restock"
    t.string   "availability",     :limit => 5
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.string   "build_status"
    t.text     "message"
  end

  add_index "rx_alerts", ["pharmacy_id"], :name => "index_rx_alerts_on_pharmacy_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.integer  "employable_id"
    t.string   "employable_type"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
