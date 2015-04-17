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

ActiveRecord::Schema.define(version: 20150417043936) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "cohorts", force: :cascade do |t|
    t.string   "title"
    t.boolean  "is_current"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.text     "introduction"
  end

  create_table "programs", force: :cascade do |t|
    t.string   "title"
    t.string   "logo_img"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "short_name"
  end

  create_table "projects", force: :cascade do |t|
    t.integer  "cohort_id"
    t.integer  "program_id"
    t.string   "title"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "web_url"
    t.string   "repo_url"
    t.text     "description"
    t.integer  "order"
  end

  add_index "projects", ["cohort_id"], name: "index_projects_on_cohort_id", using: :btree
  add_index "projects", ["program_id"], name: "index_projects_on_program_id", using: :btree

  create_table "students", force: :cascade do |t|
    t.integer  "project_id"
    t.string   "name"
    t.string   "email"
    t.string   "twitter"
    t.string   "github"
    t.text     "bio"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "headshot_img"
    t.string   "portfolio_url"
  end

  add_index "students", ["project_id"], name: "index_students_on_project_id", using: :btree

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "projects", "cohorts"
  add_foreign_key "projects", "programs"
  add_foreign_key "students", "projects"
end
