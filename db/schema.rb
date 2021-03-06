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

ActiveRecord::Schema.define(version: 20150729131911) do

  create_table "companies", force: :cascade do |t|
    t.string   "company_name",   null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "company_avatar"
  end

  create_table "departments", force: :cascade do |t|
    t.string   "department_name", null: false
    t.integer  "company_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "departments", ["company_id"], name: "index_departments_on_company_id"

  create_table "employees", force: :cascade do |t|
    t.string   "first_name",             null: false
    t.string   "last_name",              null: false
    t.string   "position_title",         null: false
    t.string   "gender",                 null: false
    t.date     "date_of_birth",          null: false
    t.string   "address"
    t.string   "suburb"
    t.string   "state"
    t.integer  "postcode"
    t.integer  "home_phone"
    t.integer  "mobile"
    t.string   "email"
    t.integer  "tax_file_number"
    t.string   "nok_name"
    t.string   "nok_relationship"
    t.string   "nok_address"
    t.string   "nok_suburb"
    t.string   "nok_state"
    t.integer  "nok_postcode"
    t.integer  "nok_home_phone"
    t.integer  "nok_mobile"
    t.integer  "nok_work_phone"
    t.date     "employee_hire_date",     null: false
    t.string   "employment_status"
    t.float    "annual_pay"
    t.float    "monthly_pay"
    t.float    "hourly_rate"
    t.string   "benefits"
    t.string   "bank_name"
    t.string   "bank_branch"
    t.string   "account_name"
    t.integer  "bsb_number"
    t.integer  "account_number"
    t.string   "tax_dec_form"
    t.string   "super_form"
    t.boolean  "it_licences"
    t.string   "employee_photo"
    t.boolean  "business_card"
    t.integer  "department_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "annual_leave_allowance"
    t.integer  "sick_leave_allowance"
    t.integer  "other_leave_allowance"
    t.string   "country"
    t.string   "nok_country"
  end

  add_index "employees", ["department_id"], name: "index_employees_on_department_id"

  create_table "it_licences", force: :cascade do |t|
    t.string   "licence_provider"
    t.integer  "department_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "leave_totals", force: :cascade do |t|
    t.float    "annual_leave",         null: false
    t.float    "sick_leave",           null: false
    t.float    "other_leave",          null: false
    t.integer  "employee_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "reasons_for_leave"
    t.date     "date_leave_requested"
  end

  add_index "leave_totals", ["employee_id"], name: "index_leave_totals_on_employee_id"

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "company_name"
    t.integer  "company_id"
    t.string   "company_avatar"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
