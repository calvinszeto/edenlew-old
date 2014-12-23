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

ActiveRecord::Schema.define(version: 20141223185907) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: true do |t|
    t.string "name"
  end

  create_table "categorizations", force: true do |t|
    t.integer "project_id"
    t.integer "category_id"
  end

  add_index "categorizations", ["category_id"], name: "index_categorizations_on_category_id", using: :btree
  add_index "categorizations", ["project_id"], name: "index_categorizations_on_project_id", using: :btree

  create_table "images", force: true do |t|
    t.text    "caption"
    t.string  "file"
    t.integer "project_id"
    t.boolean "primary_icon"
    t.integer "position"
  end

  create_table "projects", force: true do |t|
    t.string   "name"
    t.date     "start_date"
    t.date     "finish_date"
    t.text     "content"
    t.boolean  "visible",     default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
