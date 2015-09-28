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

ActiveRecord::Schema.define(version: 20150922202956) do

  create_table "admin_users", force: :cascade do |t|
    t.string   "first_name",      default: "",    null: false
    t.string   "last_name",       default: "",    null: false
    t.string   "role",                            null: false
    t.string   "email",                           null: false
    t.boolean  "status",          default: false
    t.string   "token",                           null: false
    t.string   "password_digest",                 null: false
    t.string   "preferences"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true

  create_table "calendar_events", force: :cascade do |t|
    t.string   "title"
    t.datetime "start_time"
    t.datetime "endtime"
    t.integer  "cost"
    t.boolean  "show_register_link"
    t.boolean  "show_donate_link"
    t.boolean  "childcare_available"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.text     "markdown"
    t.text     "html"
    t.datetime "published"
    t.string   "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
