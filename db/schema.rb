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

ActiveRecord::Schema.define(:version => 20140510202426) do

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
  end

  add_index "rx_alerts", ["pharmacy_id"], :name => "index_rx_alerts_on_pharmacy_id"

end
