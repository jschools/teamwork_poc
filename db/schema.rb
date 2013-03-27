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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130327063016) do

  create_table "divisions", :force => true do |t|
    t.string   "name"
    t.integer  "lead_person_id"
    t.integer  "admin_user_id"
    t.integer  "project_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "divisions", ["admin_user_id"], :name => "index_divisions_on_admin_user_id"
  add_index "divisions", ["lead_person_id"], :name => "index_divisions_on_lead_person_id"
  add_index "divisions", ["project_id"], :name => "index_divisions_on_project_id"

  create_table "people", :force => true do |t|
    t.string   "first"
    t.string   "last"
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "people", ["email"], :name => "index_people_on_email", :unique => true

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "team_roles", :force => true do |t|
    t.integer  "team_id"
    t.integer  "person_id"
    t.integer  "role_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "team_roles", ["person_id"], :name => "index_team_roles_on_person_id"
  add_index "team_roles", ["role_id"], :name => "index_team_roles_on_role_id"
  add_index "team_roles", ["team_id", "person_id", "role_id"], :name => "index_team_roles_on_team_id_and_person_id_and_role_id", :unique => true
  add_index "team_roles", ["team_id"], :name => "index_team_roles_on_team_id"

  create_table "teams", :force => true do |t|
    t.string   "name"
    t.integer  "division_id"
    t.integer  "lead_person_id"
    t.integer  "admin_user_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "password_digest"
    t.boolean  "sysadmin",        :default => false
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

end
