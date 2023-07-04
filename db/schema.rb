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

ActiveRecord::Schema.define(version: 2020_02_13_195355) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ceremonies", force: :cascade do |t|
    t.integer "ceremony_type"
    t.string "venue"
    t.integer "burial_type"
    t.string "details"
    t.string "epitaph"
    t.string "funeral_home"
    t.string "press_release"
    t.bigint "user_id"
    t.bigint "speaker_id"
    t.bigint "music_selector_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["music_selector_id"], name: "index_ceremonies_on_music_selector_id"
    t.index ["speaker_id"], name: "index_ceremonies_on_speaker_id"
    t.index ["user_id"], name: "index_ceremonies_on_user_id"
  end

  create_table "contact_memories", force: :cascade do |t|
    t.bigint "contact_id"
    t.bigint "memory_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contact_id"], name: "index_contact_memories_on_contact_id"
    t.index ["memory_id"], name: "index_contact_memories_on_memory_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.boolean "is_executor"
    t.string "first_name"
    t.string "last_name"
    t.string "relationship"
    t.string "email"
    t.string "release_code"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "phone_number"
    t.index ["user_id"], name: "index_contacts_on_user_id"
  end

  create_table "memories", force: :cascade do |t|
    t.string "image_url"
    t.string "audio_url"
    t.string "title"
    t.string "video_url"
    t.string "description"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_memories_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "pronouns"
    t.date "birthdate"
    t.string "nationality"
    t.string "nickname"
    t.string "legal_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "valuables", force: :cascade do |t|
    t.string "title"
    t.string "image_url"
    t.integer "value"
    t.string "description"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "item"
    t.string "photo"
    t.string "category"
    t.bigint "contact_id"
    t.index ["contact_id"], name: "index_valuables_on_contact_id"
    t.index ["user_id"], name: "index_valuables_on_user_id"
  end

  add_foreign_key "ceremonies", "contacts", column: "music_selector_id"
  add_foreign_key "ceremonies", "contacts", column: "speaker_id"
  add_foreign_key "ceremonies", "users"
  add_foreign_key "contact_memories", "contacts"
  add_foreign_key "contact_memories", "memories"
  add_foreign_key "contacts", "users"
  add_foreign_key "memories", "users"
  add_foreign_key "valuables", "users"
end
