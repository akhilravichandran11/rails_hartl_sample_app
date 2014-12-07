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

ActiveRecord::Schema.define(version: 20141207194402) do

  create_table "bookings", force: true do |t|
    t.integer  "ConferenceRoom_id"
    t.integer  "user_id"
    t.string   "status"
    t.integer  "stHour"
    t.integer  "stMin"
    t.datetime "stTime"
    t.integer  "enHour"
    t.integer  "enMin"
    t.datetime "enTime"
    t.integer  "day"
    t.integer  "month"
    t.integer  "year"
    t.datetime "date"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "bookings", ["ConferenceRoom_id"], name: "index_bookings_on_ConferenceRoom_id"
  add_index "bookings", ["user_id"], name: "index_bookings_on_user_id"

  create_table "conference_rooms", force: true do |t|
    t.string   "name"
    t.integer  "floor"
    t.string   "buildingName"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "type"
    t.integer  "capacity"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "conference_rooms", ["name", "buildingName"], name: "index_conference_rooms_on_name_and_buildingName", unique: true

  create_table "confroombookings", force: true do |t|
    t.integer  "user_id"
    t.integer  "room_id"
    t.boolean  "roomstatus"
    t.string   "roomstatusreason"
    t.integer  "stHour"
    t.integer  "stMin"
    t.integer  "enHour"
    t.integer  "enMin"
    t.integer  "bday"
    t.integer  "bmonth"
    t.integer  "byear"
    t.datetime "bdate"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "confroombookings", ["room_id"], name: "index_confroombookings_on_room_id"
  add_index "confroombookings", ["user_id"], name: "index_confroombookings_on_user_id"

  create_table "holidays", force: true do |t|
    t.date     "hdate"
    t.string   "hname"
    t.boolean  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "microposts", force: true do |t|
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "microposts", ["user_id", "created_at"], name: "index_microposts_on_user_id_and_created_at"
  add_index "microposts", ["user_id"], name: "index_microposts_on_user_id"

  create_table "relationships", force: true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "relationships", ["followed_id"], name: "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id"

  create_table "roombookings", force: true do |t|
    t.integer  "user_id"
    t.integer  "room_id"
    t.integer  "stHour"
    t.integer  "stMin"
    t.integer  "enHour"
    t.integer  "enMin"
    t.integer  "bday"
    t.integer  "bmonth"
    t.integer  "byear"
    t.datetime "bdate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "roombookings", ["room_id"], name: "index_roombookings_on_room_id"
  add_index "roombookings", ["user_id"], name: "index_roombookings_on_user_id"

  create_table "rooms", force: true do |t|
    t.string   "roomname"
    t.string   "roomtype"
    t.integer  "roomcapacity"
    t.integer  "floor"
    t.string   "buildingname"
    t.string   "campusname"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "rooms", ["roomname", "buildingname", "campusname"], name: "index_rooms_on_roomname_and_buildingname_and_campusname", unique: true

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "password_digest"
    t.boolean  "admin",           default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
