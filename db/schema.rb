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

ActiveRecord::Schema.define(version: 2021_04_30_094801) do

  create_table "children", force: :cascade do |t|
    t.string "name"
    t.string "birthday"
    t.string "child_centers_name"
    t.integer "child_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "group_id"
    t.integer "group_number"
    t.index ["group_id"], name: "index_children_on_group_id"
  end

  create_table "children_diaries", force: :cascade do |t|
    t.text "living"
    t.text "health"
    t.text "visit"
    t.text "information"
    t.integer "children_id", null: false
    t.integer "group_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "group_number"
    t.date "date"
    t.index ["children_id"], name: "index_children_diaries_on_children_id"
    t.index ["group_id"], name: "index_children_diaries_on_group_id"
    t.index ["user_id"], name: "index_children_diaries_on_user_id"
  end

  create_table "children_diary_logs", force: :cascade do |t|
    t.text "living"
    t.text "health"
    t.text "visit"
    t.text "information"
    t.integer "children_id", null: false
    t.integer "group_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["children_id"], name: "index_children_diary_logs_on_children_id"
    t.index ["group_id"], name: "index_children_diary_logs_on_group_id"
    t.index ["user_id"], name: "index_children_diary_logs_on_user_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "group_name"
    t.integer "group_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "provider"
    t.string "uid"
    t.string "username"
    t.boolean "admin", default: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "children", "groups"
  add_foreign_key "children_diaries", "children", column: "children_id"
  add_foreign_key "children_diaries", "groups"
  add_foreign_key "children_diaries", "users"
  add_foreign_key "children_diary_logs", "children", column: "children_id"
  add_foreign_key "children_diary_logs", "groups"
  add_foreign_key "children_diary_logs", "users"
end
