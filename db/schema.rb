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

ActiveRecord::Schema.define(:version => 20120307215951) do

  create_table "events", :force => true do |t|
    t.string   "name"
    t.datetime "start_date"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "parent_id"
  end

  add_index "events", ["parent_id"], :name => "index_events_on_parent_id"
  add_index "events", ["start_date"], :name => "index_events_on_start_date"

  create_table "events_people", :id => false, :force => true do |t|
    t.integer "event_id"
    t.integer "person_id"
  end

  add_index "events_people", ["event_id", "person_id"], :name => "index_events_people_on_event_id_and_person_id"
  add_index "events_people", ["person_id", "event_id"], :name => "index_events_people_on_person_id_and_event_id"

  create_table "households", :force => true do |t|
    t.string "family_name"
    t.string "main_phone"
  end

  create_table "people", :force => true do |t|
    t.string   "title"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "name_suffix"
    t.string   "main_phone"
    t.string   "main_email"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "full_name"
    t.integer  "household_id"
    t.boolean  "head_of_household"
  end

  add_index "people", ["full_name"], :name => "index_people_on_full_name"

  create_table "rails_admin_histories", :force => true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 5
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_rails_admin_histories"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
