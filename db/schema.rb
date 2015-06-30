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

ActiveRecord::Schema.define(version: 20150630030301) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "airlines", force: :cascade do |t|
    t.string "name"
  end

  create_table "airports", force: :cascade do |t|
    t.integer "city_id"
    t.string  "name"
    t.string  "airport_code"
  end

  create_table "cities", force: :cascade do |t|
    t.string  "name"
    t.integer "country_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.text   "visa_requirements"
    t.string "subregion"
    t.string "region"
  end

  create_table "flights", force: :cascade do |t|
    t.integer  "trip_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "airline_id"
    t.datetime "arrival_time"
    t.datetime "departure_time"
  end

  create_table "passports", force: :cascade do |t|
    t.string   "origin_country"
    t.string   "destination_country"
    t.integer  "user_id"
    t.integer  "country_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "routes", force: :cascade do |t|
    t.integer "airline_id"
    t.integer "origin_airport_id"
    t.integer "destination_airport_id"
    t.integer "flight_id"
  end

  create_table "trips", force: :cascade do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.string   "destination_country"
    t.string   "destination_city"
    t.string   "origin_country"
    t.string   "origin_city"
    t.integer  "user_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "duration"
    t.string   "timespan"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone_number"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_hash"
    t.string   "password_digest"
  end

end
