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

ActiveRecord::Schema.define(version: 2019_05_15_010025) do

  create_table "internet_packages", force: :cascade do |t|
    t.string "plan"
    t.float "price"
    t.integer "upload_speed"
    t.integer "download_speed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "internet_status_changes", force: :cascade do |t|
    t.boolean "active"
    t.string "comment"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payments", force: :cascade do |t|
    t.integer "user_id"
    t.integer "internet_package_id"
    t.datetime "payed_date"
    t.integer "months"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "service_periods", force: :cascade do |t|
    t.integer "user_id"
    t.integer "internet_package_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "password_digest"
    t.string "email"
    t.string "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "uid"
  end

end
