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

ActiveRecord::Schema.define(version: 20161121170135) do

  create_table "data_entries", force: :cascade do |t|
    t.float    "temperature",                      null: false
    t.string   "temperature_unit",                 null: false
    t.float    "latitude",                         null: false
    t.float    "longitude",                        null: false
    t.float    "altitude",                         null: false
    t.boolean  "outside",          default: false
    t.string   "notes"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

end
