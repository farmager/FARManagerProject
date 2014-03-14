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

ActiveRecord::Schema.define(version: 20140314090643) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: true do |t|
    t.string   "title"
    t.boolean  "state",      default: true
    t.integer  "position",   default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "croprotations", force: true do |t|
    t.integer  "user_id"
    t.string   "land_location"
    t.string   "planned_crop_year1"
    t.string   "year1"
    t.string   "planned_crop_year2"
    t.string   "year2"
    t.string   "planned_crop_year3"
    t.string   "year3"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "equipment", force: true do |t|
    t.string   "notes"
    t.integer  "user_id"
    t.string   "name"
    t.string   "make"
    t.string   "model"
    t.integer  "year"
    t.integer  "value"
    t.string   "category"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.date     "maintenance_date"
    t.date     "next_maintenance_date"
    t.integer  "mileage_or_engine_hours"
    t.string   "maintenance_notes"
    t.integer  "maintenance_data"
  end

  add_index "equipment", ["user_id", "created_at"], name: "index_equipment_on_user_id_and_created_at", using: :btree

  create_table "expenses", force: true do |t|
    t.integer  "user_id"
    t.integer  "year"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "notes"
    t.float    "pulse"
    t.float    "cereals"
    t.float    "canola"
    t.float    "flax"
    t.float    "fertilizer"
    t.float    "chemicals"
    t.float    "insurancepremium"
    t.float    "machinery_fuel"
    t.float    "electricity"
    t.float    "trucking"
    t.float    "heating_fuel"
    t.float    "machinery_repairs"
    t.float    "building_repairs"
    t.float    "machinery_rent"
    t.float    "interest"
    t.float    "subscription_costs"
    t.float    "office_expenses"
    t.float    "accounting_legalfees"
    t.float    "property_taxes"
    t.float    "rents"
    t.float    "vehicle_expenses"
    t.float    "hardware_costs"
    t.float    "telephone"
    t.float    "gross_income"
    t.float    "total_expenses"
    t.float    "total_taxable"
    t.float    "tax_owed"
  end

  create_table "fields", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "notes"
    t.string   "land_location"
    t.string   "land_name"
    t.string   "crop_type"
    t.string   "variety"
    t.date     "seeding_date"
    t.integer  "f_nitrogen"
    t.integer  "f_phosphorous"
    t.integer  "f_sulphur"
    t.integer  "f_potassium"
    t.string   "herbicides"
    t.string   "fungicides"
    t.integer  "seeded_acres"
    t.integer  "netyield"
    t.integer  "grade"
    t.integer  "production"
    t.integer  "year"
  end

  add_index "fields", ["user_id", "created_at"], name: "index_fields_on_user_id_and_created_at", using: :btree

  create_table "forums", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.boolean  "state",        default: true
    t.integer  "topics_count", default: 0
    t.integer  "posts_count",  default: 0
    t.integer  "position",     default: 0
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "inventories", force: true do |t|
    t.string   "name"
    t.integer  "capacity"
    t.string   "commodity"
    t.string   "ticket_no"
    t.integer  "moisture_content"
    t.string   "notes"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cropyear"
    t.string   "bin"
    t.string   "commodity_variety"
    t.string   "harvested_field"
    t.string   "status"
    t.string   "price"
  end

  add_index "inventories", ["user_id", "created_at"], name: "index_inventories_on_user_id_and_created_at", using: :btree

  create_table "maintenances", force: true do |t|
    t.integer  "user_id"
    t.date     "maintenance_date"
    t.date     "next_maintenance_date"
    t.string   "maintenance_notes"
    t.integer  "mainteance_data"
    t.float    "maintenance_cost"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "equipment_maintained"
  end

  create_table "observations", force: true do |t|
    t.string   "observation_type"
    t.integer  "year"
    t.string   "landparcel"
    t.string   "cropobserved"
    t.string   "severity"
    t.string   "growthstage"
    t.string   "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "user_id"
    t.date     "date_observed"
    t.string   "observation_specific"
  end

  create_table "posts", force: true do |t|
    t.text     "body"
    t.integer  "forum_id"
    t.integer  "topic_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "profitplanners", force: true do |t|
    t.integer  "user_id"
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "topics", force: true do |t|
    t.string   "title"
    t.integer  "hits",        default: 0
    t.boolean  "sticky",      default: false
    t.boolean  "locked",      default: false
    t.integer  "posts_count"
    t.integer  "forum_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           default: false
    t.integer  "topics_count",    default: 0
    t.integer  "posts_count",     default: 0
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

end
