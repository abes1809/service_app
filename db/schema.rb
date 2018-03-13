ss# This file is auto-generated from the current state of the database. Instead
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

ActiveRecord::Schema.define(version: 20180308004514) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contact_infos", force: :cascade do |t|
    t.string "email"
    t.string "phone_number"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.integer "prefered_contact_method"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "website"
  end

  create_table "law_services", force: :cascade do |t|
    t.string "name"
    t.integer "contact_info_id"
    t.string "specialty"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mental_health_services", force: :cascade do |t|
    t.string "name"
    t.integer "contact_info_id"
    t.string "specialty"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "qualifiers", force: :cascade do |t|
    t.string "name"
    t.integer "servicable_id"
    t.string "servicable_type"
    t.string "target_value"
    t.string "data_form"
    t.string "comparison"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shelters", force: :cascade do |t|
    t.string "name"
    t.integer "contact_info_id"
    t.string "specialty"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_services", force: :cascade do |t|
    t.integer "servicable_id"
    t.integer "user_id"
    t.string "servicable_type"
    t.integer "status"
    t.string "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.integer "contact_info_id"
    t.integer "gender"
    t.integer "sex"
    t.date "homeless_date"
    t.decimal "annual_income", precision: 10, scale: 2
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.boolean "domestic_violence_survivor", default: false
    t.integer "household_size"
    t.integer "age"
  end

end
