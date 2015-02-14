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

ActiveRecord::Schema.define(version: 20150213100726) do

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

  create_table "comfy_cms_blocks", force: true do |t|
    t.string   "identifier",                      null: false
    t.text     "content",        limit: 16777215
    t.integer  "blockable_id"
    t.string   "blockable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comfy_cms_blocks", ["blockable_id", "blockable_type"], name: "index_comfy_cms_blocks_on_blockable_id_and_blockable_type", using: :btree
  add_index "comfy_cms_blocks", ["identifier"], name: "index_comfy_cms_blocks_on_identifier", using: :btree

  create_table "comfy_cms_categories", force: true do |t|
    t.integer "site_id",          null: false
    t.string  "label",            null: false
    t.string  "categorized_type", null: false
  end

  add_index "comfy_cms_categories", ["site_id", "categorized_type", "label"], name: "index_cms_categories_on_site_id_and_cat_type_and_label", unique: true, using: :btree

  create_table "comfy_cms_categorizations", force: true do |t|
    t.integer "category_id",      null: false
    t.string  "categorized_type", null: false
    t.integer "categorized_id",   null: false
  end

  add_index "comfy_cms_categorizations", ["category_id", "categorized_type", "categorized_id"], name: "index_cms_categorizations_on_cat_id_and_catd_type_and_catd_id", unique: true, using: :btree

  create_table "comfy_cms_files", force: true do |t|
    t.integer  "site_id",                                    null: false
    t.integer  "block_id"
    t.string   "label",                                      null: false
    t.string   "file_file_name",                             null: false
    t.string   "file_content_type",                          null: false
    t.integer  "file_file_size",                             null: false
    t.string   "description",       limit: 2048
    t.integer  "position",                       default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comfy_cms_files", ["site_id", "block_id"], name: "index_comfy_cms_files_on_site_id_and_block_id", using: :btree
  add_index "comfy_cms_files", ["site_id", "file_file_name"], name: "index_comfy_cms_files_on_site_id_and_file_file_name", using: :btree
  add_index "comfy_cms_files", ["site_id", "label"], name: "index_comfy_cms_files_on_site_id_and_label", using: :btree
  add_index "comfy_cms_files", ["site_id", "position"], name: "index_comfy_cms_files_on_site_id_and_position", using: :btree

  create_table "comfy_cms_layouts", force: true do |t|
    t.integer  "site_id",                                     null: false
    t.integer  "parent_id"
    t.string   "app_layout"
    t.string   "label",                                       null: false
    t.string   "identifier",                                  null: false
    t.text     "content",    limit: 16777215
    t.text     "css",        limit: 16777215
    t.text     "js",         limit: 16777215
    t.integer  "position",                    default: 0,     null: false
    t.boolean  "is_shared",                   default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comfy_cms_layouts", ["parent_id", "position"], name: "index_comfy_cms_layouts_on_parent_id_and_position", using: :btree
  add_index "comfy_cms_layouts", ["site_id", "identifier"], name: "index_comfy_cms_layouts_on_site_id_and_identifier", unique: true, using: :btree

  create_table "comfy_cms_pages", force: true do |t|
    t.integer  "site_id",                                         null: false
    t.integer  "layout_id"
    t.integer  "parent_id"
    t.integer  "target_page_id"
    t.string   "label",                                           null: false
    t.string   "slug"
    t.string   "full_path",                                       null: false
    t.text     "content_cache",  limit: 16777215
    t.integer  "position",                        default: 0,     null: false
    t.integer  "children_count",                  default: 0,     null: false
    t.boolean  "is_published",                    default: true,  null: false
    t.boolean  "is_shared",                       default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comfy_cms_pages", ["parent_id", "position"], name: "index_comfy_cms_pages_on_parent_id_and_position", using: :btree
  add_index "comfy_cms_pages", ["site_id", "full_path"], name: "index_comfy_cms_pages_on_site_id_and_full_path", using: :btree

  create_table "comfy_cms_revisions", force: true do |t|
    t.string   "record_type",                  null: false
    t.integer  "record_id",                    null: false
    t.text     "data",        limit: 16777215
    t.datetime "created_at"
  end

  add_index "comfy_cms_revisions", ["record_type", "record_id", "created_at"], name: "index_cms_revisions_on_rtype_and_rid_and_created_at", using: :btree

  create_table "comfy_cms_sites", force: true do |t|
    t.string  "label",                       null: false
    t.string  "identifier",                  null: false
    t.string  "hostname",                    null: false
    t.string  "path"
    t.string  "locale",      default: "en",  null: false
    t.boolean "is_mirrored", default: false, null: false
  end

  add_index "comfy_cms_sites", ["hostname"], name: "index_comfy_cms_sites_on_hostname", using: :btree
  add_index "comfy_cms_sites", ["is_mirrored"], name: "index_comfy_cms_sites_on_is_mirrored", using: :btree

  create_table "comfy_cms_snippets", force: true do |t|
    t.integer  "site_id",                                     null: false
    t.string   "label",                                       null: false
    t.string   "identifier",                                  null: false
    t.text     "content",    limit: 16777215
    t.integer  "position",                    default: 0,     null: false
    t.boolean  "is_shared",                   default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comfy_cms_snippets", ["site_id", "identifier"], name: "index_comfy_cms_snippets_on_site_id_and_identifier", unique: true, using: :btree
  add_index "comfy_cms_snippets", ["site_id", "position"], name: "index_comfy_cms_snippets_on_site_id_and_position", using: :btree

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
    t.boolean  "approved",   default: false
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

  create_table "sell_evaluations", force: true do |t|
    t.integer  "post_requirement_id"
    t.string   "evaluator"
    t.text     "remarks"
    t.datetime "created_at"
    t.datetime "updated_at"
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
