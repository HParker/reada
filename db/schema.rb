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

ActiveRecord::Schema.define(version: 20161125211602) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "authorizations", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string   "provider",   null: false
    t.string   "uid",        null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree
  end

  create_table "feeds", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string   "etag"
    t.string   "url"
    t.string   "feed_url"
    t.text     "links"
    t.string   "title"
    t.string   "description"
    t.string   "language"
    t.string   "itunes_author"
    t.string   "itunes_image"
    t.string   "itunes_summary"
    t.string   "itunes_subtitle"
    t.string   "itunes_explicit"
    t.string   "itunes_keywords"
    t.string   "itunes_owners"
    t.string   "itunes_categories"
    t.datetime "last_fetched"
    t.integer  "status",            default: 0, null: false
    t.integer  "group_id"
    t.datetime "last_modified"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "groups", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stories", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.text     "title"
    t.text     "content"
    t.string   "author"
    t.string   "summary"
    t.text     "links"
    t.string   "url"
    t.text     "entry_id"
    t.datetime "updated"
    t.datetime "published"
    t.string   "enclosure_url"
    t.string   "enclosure_length"
    t.string   "enclosure_type"
    t.string   "itunes_author"
    t.string   "itunes_image"
    t.string   "itunes_duration"
    t.string   "itunes_summary"
    t.string   "itunes_subtitle"
    t.string   "itunes_explicit"
    t.uuid     "feed_id"
    t.string   "permalink"
    t.boolean  "read",             default: false, null: false
    t.boolean  "starred",          default: false, null: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "users", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "email",      null: false
    t.string   "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
