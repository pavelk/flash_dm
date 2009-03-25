# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090325141047) do

  create_table "baskets", :force => true do |t|
    t.integer "shopping_id"
    t.integer "product_id"
    t.string  "quantity"
  end

  add_index "baskets", ["product_id"], :name => "index_baskets_on_product_id"
  add_index "baskets", ["shopping_id"], :name => "index_baskets_on_shopping_id"

  create_table "codes", :force => true do |t|
    t.string "email"
    t.string "code"
  end

  add_index "codes", ["code"], :name => "index_codes_on_code"

  create_table "friends", :force => true do |t|
    t.string   "recipient_mail"
    t.string   "sender_mail"
    t.string   "sender_name"
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "galleries", :force => true do |t|
    t.integer  "user_id"
    t.string   "city"
    t.string   "author_name"
    t.string   "author_age"
    t.boolean  "user_confirm",                                                    :default => true,  :null => false
    t.boolean  "approved",                                                        :default => false, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.integer  "hits",                                                            :default => 0,     :null => false
    t.integer  "rating_count",                                                    :default => 0,     :null => false
    t.integer  "rating_total",       :limit => 10, :precision => 10, :scale => 0, :default => 0,     :null => false
    t.decimal  "rating_avg",                       :precision => 10, :scale => 2, :default => 0.0,   :null => false
  end

  create_table "news", :force => true do |t|
    t.string   "title"
    t.text     "perex"
    t.text     "description"
    t.integer  "hits",        :default => 0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notes", :force => true do |t|
    t.string   "first_name"
    t.string   "surname"
    t.string   "email"
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photos", :force => true do |t|
    t.integer  "attachable_id"
    t.string   "title"
    t.string   "attachable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  add_index "photos", ["attachable_id", "attachable_type"], :name => "index_photos_on_attachable_id_and_attachable_type"

  create_table "products", :force => true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ratings", :force => true do |t|
    t.integer "rated_id"
    t.string  "rated_type"
    t.integer "rating",     :limit => 10, :precision => 10, :scale => 0
  end

  add_index "ratings", ["rated_type", "rated_id"], :name => "index_ratings_on_rated_type_and_rated_id"

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :default => "", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "shoppings", :force => true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "msg"
    t.string   "mail"
  end

  create_table "travels", :force => true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "description"
    t.string   "duration"
    t.string   "difficulty"
    t.integer  "rating"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "location"
    t.boolean  "rules_confirm"
    t.boolean  "approved"
    t.boolean  "active"
    t.integer  "hits",                                                       :default => 0,   :null => false
    t.integer  "rating_count",                                               :default => 0,   :null => false
    t.integer  "rating_total",  :limit => 10, :precision => 10, :scale => 0, :default => 0,   :null => false
    t.decimal  "rating_avg",                  :precision => 10, :scale => 2, :default => 0.0, :null => false
  end

  add_index "travels", ["created_at"], :name => "index_travels_on_created_at"
  add_index "travels", ["rating"], :name => "index_travels_on_rating"
  add_index "travels", ["user_id"], :name => "index_travels_on_user_id"

  create_table "users", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "login"
    t.string   "crypted_password",  :default => "",    :null => false
    t.string   "password_salt",     :default => "",    :null => false
    t.string   "persistence_token", :default => "",    :null => false
    t.string   "perishable_token",  :default => "",    :null => false
    t.string   "email",             :default => "",    :null => false
    t.integer  "login_count",       :default => 0,     :null => false
    t.datetime "last_request_at"
    t.datetime "last_login_at"
    t.datetime "current_login_at"
    t.string   "last_login_ip"
    t.string   "current_login_ip"
    t.string   "family_name"
    t.string   "city"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "street"
    t.boolean  "code",              :default => false, :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["last_request_at"], :name => "index_users_on_last_request_at"
  add_index "users", ["login"], :name => "index_users_on_login"
  add_index "users", ["perishable_token"], :name => "index_users_on_perishable_token"
  add_index "users", ["persistence_token"], :name => "index_users_on_persistence_token"

end
