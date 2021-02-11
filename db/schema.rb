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

ActiveRecord::Schema.define(version: 2021_02_09_001317) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "athletes", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.boolean "injury_list"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "team_id"
    t.index ["team_id"], name: "index_athletes_on_team_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.boolean "equipment"
    t.integer "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "resort_id"
    t.index ["resort_id"], name: "index_customers_on_resort_id"
  end

  create_table "resorts", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.integer "cost"
    t.boolean "at_capacity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string "city"
    t.string "name"
    t.boolean "playoff_picture"
    t.integer "championships"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "athletes", "teams"
  add_foreign_key "customers", "resorts"
end
