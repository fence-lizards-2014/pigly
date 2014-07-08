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

ActiveRecord::Schema.define(:version => 20140705033942) do

  create_table "items", :force => true do |t|
    t.integer  "restaurant_id"
    t.string   "name",          :null => false
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "restaurants", :force => true do |t|
    t.string   "name",        :limit => 48,  :null => false
    t.string   "location",    :limit => 48
    t.string   "address",     :limit => 64
    t.string   "postal_code", :limit => 10
    t.string   "latitude",    :limit => 12
    t.string   "longitude",   :limit => 12
    t.string   "phone",       :limit => 24
    t.string   "website",     :limit => 128
    t.string   "locu_id"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "gender",          :limit => 6,  :null => false
    t.integer  "age",                           :null => false
    t.string   "zip",             :limit => 10, :null => false
    t.string   "email",           :limit => 48, :null => false
    t.string   "password_digest",               :null => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "votes", :force => true do |t|
    t.string   "direction",  :limit => 4
    t.integer  "item_id"
    t.integer  "user_id"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

end
