# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_09_17_224327) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_trgm"
  enable_extension "plpgsql"

  create_table "firebase_tokens", force: :cascade do |t|
    t.string "token"
    t.datetime "invalidated_at"
    t.bigint "user_id", null: false
    t.index ["invalidated_at"], name: "index_firebase_tokens_on_invalidated_at"
    t.index ["user_id"], name: "index_firebase_tokens_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "body"
    t.bigint "user_id", null: false
    t.index ["body"], name: "index_messages_on_body", opclass: :gin_trgm_ops, using: :gin
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "snooze_until"
    t.index ["snooze_until"], name: "index_users_on_snooze_until"
  end

  add_foreign_key "firebase_tokens", "users"
  add_foreign_key "messages", "users"
end
