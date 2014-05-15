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

ActiveRecord::Schema.define(version: 20140514130235) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "interests", force: true do |t|
    t.string "interest"
  end

  create_table "interests_users", force: true do |t|
    t.integer "user_id"
    t.integer "interest_id"
  end

  create_table "messages", force: true do |t|
    t.text     "body"
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.boolean  "sender_deleted",    default: false
    t.boolean  "recipient_deleted", default: false
    t.datetime "read_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photos", force: true do |t|
    t.string   "image_url"
    t.string   "description"
    t.integer  "user_id"
    t.boolean  "profile",     default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", force: true do |t|
    t.string   "image_url"
    t.string   "title"
    t.text     "body"
    t.integer  "user_id"
    t.string   "posting_category"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "profile_views", force: true do |t|
    t.integer  "viewer_id"
    t.integer  "viewed_id"
    t.datetime "last_time_viewed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "password_digest"
    t.string   "height"
    t.string   "sexual_orientation"
    t.string   "body_type"
    t.date     "birthdate"
    t.string   "email"
    t.string   "gender"
    t.string   "borough"
    t.string   "neighborhood"
    t.boolean  "admin_status",        default: false
    t.string   "ethnicity"
    t.string   "diet"
    t.string   "drugs"
    t.string   "drinks"
    t.string   "smokes"
    t.string   "zodiac_sign"
    t.string   "education"
    t.string   "job"
    t.string   "income"
    t.string   "relationship_status"
    t.string   "relationship_type"
    t.string   "children_family"
    t.string   "languages"
    t.string   "pets"
    t.text     "self_summary"
    t.string   "looking_for"
    t.text     "profile_image_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "fb_token"
    t.integer  "fb_expiration"
    t.integer  "zip"
  end

end
