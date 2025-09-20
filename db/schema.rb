# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_09_20_201630) do
  create_table "collaboration_participations", id: false, force: :cascade do |t|
    t.integer "participator_id", null: false
    t.integer "collaboration_id", null: false
  end

  create_table "collaboration_taggings", id: false, force: :cascade do |t|
    t.integer "collaboration_id", null: false
    t.integer "tag_id", null: false
  end

  create_table "collaborations", force: :cascade do |t|
    t.string "path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "participator_taggings", id: false, force: :cascade do |t|
    t.integer "participator_id", null: false
    t.integer "tag_id", null: false
  end

  create_table "participators", force: :cascade do |t|
    t.string "name", null: false
    t.string "directory_path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sessions", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "ip_address"
    t.string "user_agent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.string "directory_path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email_address", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "participator_id"
    t.index ["email_address"], name: "index_users_on_email_address", unique: true
    t.index ["participator_id"], name: "index_users_on_participator_id"
  end

  add_foreign_key "sessions", "users"
  add_foreign_key "users", "participators"
end
