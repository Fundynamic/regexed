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

ActiveRecord::Schema.define(version: 20150616180208) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "opportunities", force: true do |t|
    t.string   "title",           default: "", null: false
    t.text     "teaser",          default: "", null: false
    t.datetime "start_date",                   null: false
    t.datetime "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "organisation_id"
    t.string   "skills"
    t.datetime "closed_at"
  end

  create_table "opportunity_scores", force: true do |t|
    t.integer  "score",          default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "role_id"
    t.integer  "opportunity_id"
  end

  add_index "opportunity_scores", ["opportunity_id"], name: "index_opportunity_scores_on_opportunity_id", using: :btree
  add_index "opportunity_scores", ["role_id"], name: "index_opportunity_scores_on_role_id", using: :btree

  create_table "reactions", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "role_id"
    t.integer  "opportunity_id"
    t.integer  "score",          default: 0
  end

  add_index "reactions", ["opportunity_id"], name: "index_reactions_on_opportunity_id", using: :btree
  add_index "reactions", ["role_id"], name: "index_reactions_on_role_id", using: :btree

  create_table "roles", force: true do |t|
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "first_name"
    t.string   "last_name"
    t.date     "available"
    t.string   "name"
    t.string   "skills"
    t.string   "pitch"
    t.decimal  "lat",          precision: 8, scale: 2, default: 0.0
    t.decimal  "lon",          precision: 8, scale: 2, default: 0.0
    t.integer  "likes_budget",                         default: 0
    t.string   "contact_info"
  end

  add_index "roles", ["user_id"], name: "index_roles_on_user_id", using: :btree

  create_table "skills", force: true do |t|
    t.string   "name"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "skills", ["name"], name: "index_skills_on_name", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
