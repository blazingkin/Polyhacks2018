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

ActiveRecord::Schema.define(version: 20180113223659) do

  create_table "chat_messages", force: :cascade do |t|
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "parent_id"
    t.text     "message"
    t.integer  "recipient_fk"
    t.index ["parent_id"], name: "index_chat_messages_on_parent_id"
  end

  create_table "children", force: :cascade do |t|
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "parent_id"
    t.string   "name"
    t.integer  "age"
    t.text     "bio"
    t.integer  "job_listing_id"
    t.index ["job_listing_id"], name: "index_children_on_job_listing_id"
    t.index ["parent_id"], name: "index_children_on_parent_id"
  end

  create_table "job_listings", force: :cascade do |t|
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "parent_id"
    t.text     "info"
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "child_number"
    t.index ["parent_id"], name: "index_job_listings_on_parent_id"
  end

  create_table "parents", force: :cascade do |t|
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "name"
    t.string   "email"
    t.string   "phone_number"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "uid",              limit: 8
    t.string   "provider"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.text     "bio"
    t.integer  "points"
  end

end
