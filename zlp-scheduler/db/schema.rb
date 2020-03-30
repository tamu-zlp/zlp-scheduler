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

ActiveRecord::Schema.define(version: 20200330202835) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: :cascade do |t|
    t.string   "full_subject"
    t.string   "abbreviated_subject"
    t.integer  "course_number"
    t.integer  "section_number"
    t.datetime "meetingtime_start"
    t.datetime "meetingtime_end"
    t.string   "meeting_days",                     array: true
    t.string   "instructors",                      array: true
    t.string   "meeting_location"
    t.integer  "term_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["instructors"], name: "index_courses_on_instructors", using: :gin
    t.index ["meeting_days"], name: "index_courses_on_meeting_days", using: :gin
    t.index ["term_id"], name: "index_courses_on_term_id", using: :btree
  end

  create_table "terms", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "courses", "terms"
end
