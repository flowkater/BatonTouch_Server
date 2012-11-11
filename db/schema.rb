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

ActiveRecord::Schema.define(:version => 20121105144140) do

  create_table "api_keys", :force => true do |t|
    t.string   "access_token"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "cashes", :force => true do |t|
    t.integer  "cookie",         :default => 0, :null => false
    t.integer  "cookiable_id"
    t.string   "cookiable_type"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "cashes", ["cookiable_id", "cookiable_type"], :name => "index_cashes_on_cookiable_id_and_cookiable_type", :unique => true

  create_table "giftcons", :force => true do |t|
    t.string   "authkey"
    t.integer  "giftconable_id"
    t.string   "giftconable_type"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "pictures", :force => true do |t|
    t.string   "name"
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "reviews", :force => true do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "target_id"
    t.integer  "status"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tasks", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "fromloc"
    t.string   "toloc"
    t.string   "spendtime"
    t.string   "calldate"
    t.string   "enddate"
    t.integer  "status",      :default => 0, :null => false
    t.integer  "user_id"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "tradestats", :force => true do |t|
    t.boolean  "status",     :default => false, :null => false
    t.integer  "client_id"
    t.integer  "task_id"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "tradestats", ["client_id", "task_id"], :name => "index_tradestats_on_client_id_and_task_id", :unique => true

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.string   "company"
    t.string   "phone"
    t.text     "introduce"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "authentication_token"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["authentication_token"], :name => "index_users_on_authentication_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
