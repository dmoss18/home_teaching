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

ActiveRecord::Schema.define(version: 20170623033441) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assignments", force: :cascade do |t|
    t.integer  "quorum_member_id"
    t.integer  "household_id"
    t.string   "assignment_type"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["household_id"], name: "index_assignments_on_household_id", using: :btree
    t.index ["quorum_member_id", "household_id"], name: "index_assignments_on_quorum_member_id_and_household_id", unique: true, using: :btree
    t.index ["quorum_member_id"], name: "index_assignments_on_quorum_member_id", using: :btree
  end

  create_table "households", force: :cascade do |t|
    t.string   "name"
    t.string   "street"
    t.string   "city"
    t.string   "zip"
    t.string   "state"
    t.integer  "ward_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "ward_id"], name: "index_households_on_name_and_ward_id", unique: true, using: :btree
    t.index ["ward_id"], name: "index_households_on_ward_id", using: :btree
  end

  create_table "quorum_members", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "household_id"
    t.integer  "quorum_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "role",         default: "member"
    t.index ["household_id"], name: "index_quorum_members_on_household_id", using: :btree
    t.index ["quorum_id"], name: "index_quorum_members_on_quorum_id", using: :btree
    t.index ["role"], name: "index_quorum_members_on_role", using: :btree
    t.index ["user_id"], name: "index_quorum_members_on_user_id", unique: true, using: :btree
  end

  create_table "quorums", force: :cascade do |t|
    t.string   "name"
    t.string   "quorum_type"
    t.integer  "ward_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["name", "ward_id"], name: "index_quorums_on_name_and_ward_id", unique: true, using: :btree
    t.index ["ward_id"], name: "index_quorums_on_ward_id", using: :btree
  end

  create_table "reports", force: :cascade do |t|
    t.integer  "assignment_id"
    t.text     "message"
    t.string   "status"
    t.string   "household_name"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.date     "period",         default: '2017-06-22', null: false
    t.index ["assignment_id"], name: "index_reports_on_assignment_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                             default: "", null: false
    t.string   "authentication_token",   limit: 30
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.string   "password_digest"
    t.index ["authentication_token"], name: "index_users_on_authentication_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "wards", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_wards_on_name", unique: true, using: :btree
  end

  add_foreign_key "assignments", "households"
  add_foreign_key "assignments", "quorum_members"
  add_foreign_key "households", "wards"
  add_foreign_key "quorum_members", "households"
  add_foreign_key "quorum_members", "quorums"
  add_foreign_key "quorum_members", "users"
  add_foreign_key "quorums", "wards"
end
