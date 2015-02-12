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

ActiveRecord::Schema.define(version: 20150212002002) do

  create_table "admins", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "school_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "admins", ["school_id"], name: "index_admins_on_school_id"

  create_table "images", force: true do |t|
    t.integer  "admin_id"
    t.integer  "school_id"
    t.integer  "table_id"
    t.string   "table_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "images", ["admin_id"], name: "index_images_on_admin_id"
  add_index "images", ["school_id"], name: "index_images_on_school_id"
  add_index "images", ["table_id", "table_type"], name: "index_images_on_table_id_and_table_type"

  create_table "newsfeeds", force: true do |t|
    t.integer  "school_id"
    t.integer  "admin_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.integer  "updated_by_id"
  end

  add_index "newsfeeds", ["admin_id"], name: "index_newsfeeds_on_admin_id"
  add_index "newsfeeds", ["school_id"], name: "index_newsfeeds_on_school_id"
  add_index "newsfeeds", ["updated_by_id"], name: "index_newsfeeds_on_updated_by_id"

  create_table "schools", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.integer  "zipcode"
    t.string   "logo"
  end

  create_table "styles", force: true do |t|
    t.integer  "school_id"
    t.text     "current"
    t.text     "previous"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "styles", ["school_id"], name: "index_styles_on_school_id"

end
