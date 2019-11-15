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

ActiveRecord::Schema.define(version: 2019_11_11_123610) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "schools", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string "name"
    t.integer "rank"
    t.string "standard"
    t.integer "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subjects", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string "sub_name"
    t.integer "sub_code"
    t.uuid "teacher_id", default: -> { "uuid_generate_v4()" }
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subjectstudents", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.uuid "student_id", default: -> { "uuid_generate_v4()" }
    t.uuid "subject_id", default: -> { "uuid_generate_v4()" }
    t.integer "marks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teachers", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "email"
    t.string "password_hash"
    t.string "password_salt"
    t.boolean "active", default: true
    t.string "auth_token"
    t.string "role", default: "user"
    t.uuid "school_id", default: -> { "uuid_generate_v4()" }
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
