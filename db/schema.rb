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

ActiveRecord::Schema.define(version: 20151117232428) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "commits", force: :cascade do |t|
    t.string   "committer_name"
    t.string   "committer_date"
    t.string   "committer_avatar_url"
    t.string   "commit_message"
    t.string   "url"
    t.string   "html_url"
    t.string   "image"
    t.integer  "user_id"
    t.integer  "repo_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "sha"
  end

  add_index "commits", ["repo_id"], name: "index_commits_on_repo_id", using: :btree
  add_index "commits", ["user_id"], name: "index_commits_on_user_id", using: :btree

  create_table "repos", force: :cascade do |t|
    t.string   "rid"
    t.string   "name"
    t.string   "full_name"
    t.integer  "user_id"
    t.string   "html_url"
    t.string   "description"
    t.string   "owner"
    t.string   "owner_avatar_url"
    t.string   "owner_html_url"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "git_created_at"
    t.string   "git_updated_at"
    t.string   "git_pushed_at"
  end

  add_index "repos", ["user_id"], name: "index_repos_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "provider"
    t.string   "name"
    t.string   "nickname"
    t.string   "uid"
    t.string   "image"
    t.string   "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "commits", "repos"
  add_foreign_key "commits", "users"
  add_foreign_key "repos", "users"
end
