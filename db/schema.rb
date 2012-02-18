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

ActiveRecord::Schema.define(:version => 20120217230621) do

  create_table "events", :force => true do |t|
    t.string   "name"
    t.datetime "start_date"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "parent_id"
  end

  add_index "events", ["parent_id"], :name => "index_events_on_parent_id"
  add_index "events", ["start_date"], :name => "index_events_on_start_date"

  create_table "people", :force => true do |t|
    t.string   "title"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "name_suffix"
    t.string   "main_phone"
    t.string   "main_email"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "full_name"
  end

  add_index "people", ["full_name"], :name => "index_people_on_full_name"

end
