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

ActiveRecord::Schema.define(version: 20150210061348) do

  create_table "admins", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "associate_partners", force: true do |t|
    t.string   "name"
    t.string   "phone"
    t.text     "address"
    t.string   "email"
    t.string   "dealer_type"
    t.string   "dealer_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status",      default: "No"
  end

  create_table "car_evaluations", force: true do |t|
    t.integer  "sell_car_id"
    t.string   "evaluator"
    t.text     "remarks"
    t.float    "expected_price",                limit: 24
    t.float    "evaluated_price",               limit: 24
    t.float    "deal_price1",                   limit: 24
    t.float    "deal_price2",                   limit: 24
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "evaluation_image_file_name"
    t.string   "evaluation_image_content_type"
    t.integer  "evaluation_image_file_size"
    t.datetime "evaluation_image_updated_at"
  end

  create_table "car_models", force: true do |t|
    t.integer  "manufacturer_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "car_specifications", force: true do |t|
    t.integer  "specification_category_id"
    t.integer  "specification_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "vehicle_id"
  end

  create_table "careers", force: true do |t|
    t.string   "resume_title"
    t.string   "name"
    t.string   "sex"
    t.text     "address"
    t.string   "email"
    t.string   "phone"
    t.string   "job_category"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "resume_file_name"
    t.string   "resume_content_type"
    t.integer  "resume_file_size"
    t.datetime "resume_updated_at"
  end

  create_table "images", force: true do |t|
    t.integer  "vehicle_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "manufacturers", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "post_requirements", force: true do |t|
    t.string   "min_budget"
    t.string   "max_budget"
    t.string   "min_year"
    t.string   "max_year"
    t.string   "make"
    t.string   "model"
    t.string   "body_type"
    t.string   "fuel_type"
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sell_cars", force: true do |t|
    t.integer  "varient_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "manufacture_year"
    t.string   "owner_type"
    t.float    "kms_done",             limit: 24
    t.string   "city"
    t.string   "color"
    t.string   "transmission"
    t.string   "registration_no"
    t.string   "ownership"
    t.string   "car_insurence"
    t.string   "when_to_sell"
    t.datetime "insurence_valid_till"
    t.float    "expected_price",       limit: 24
    t.text     "comments"
    t.string   "seller_name"
    t.string   "seller_email"
    t.string   "seller_phone"
    t.string   "seller_organization"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status",                          default: "enquiry"
  end

  create_table "share_fbs", force: true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "secret_token"
    t.string   "email"
    t.string   "secret"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "specification_categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "specifications", force: true do |t|
    t.integer  "specification_category_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "testimonials", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.text     "testimonial"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "approve",                     default: false
    t.string   "customer_image_file_name"
    t.string   "customer_image_content_type"
    t.integer  "customer_image_file_size"
    t.datetime "customer_image_updated_at"
    t.string   "feedback_image_file_name"
    t.string   "feedback_image_content_type"
    t.integer  "feedback_image_file_size"
    t.datetime "feedback_image_updated_at"
    t.string   "display"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "approved",               default: false
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "varients", force: true do |t|
    t.integer  "car_model_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vehicles", force: true do |t|
    t.integer  "varient_id"
    t.text     "location"
    t.string   "body_style"
    t.string   "exterior_color"
    t.string   "reg_year"
    t.string   "manufactured_year"
    t.string   "milage"
    t.string   "fuel_type"
    t.string   "engine_type"
    t.string   "transmission"
    t.string   "registration_state"
    t.string   "registration_no"
    t.float    "sell_price",         limit: 24
    t.string   "sterio"
    t.string   "seat_covers"
    t.string   "car_for"
    t.string   "visible_status"
    t.string   "where_is_car"
    t.float    "offer_price",        limit: 24
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "status"
    t.integer  "manufacturer_id"
    t.integer  "car_model_id"
    t.integer  "user_id"
  end

  create_table "videos", force: true do |t|
    t.integer  "vehicle_id"
    t.string   "video_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
