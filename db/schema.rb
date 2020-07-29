# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_07_28_192202) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assigned_tax_codes", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "entity_id"
    t.string "name"
    t.string "side"
    t.string "localization"
    t.string "rate"
    t.string "type_transaction"
    t.index ["entity_id"], name: "index_assigned_tax_codes_on_entity_id"
  end

  create_table "checks", force: :cascade do |t|
    t.string "name"
    t.string "rule"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "adress"
    t.string "postal_code"
    t.string "city"
    t.string "jurisdiction"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "declaration_checks", force: :cascade do |t|
    t.integer "line_passed"
    t.integer "line_did_not_passed"
    t.integer "number_line_passed"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "transaction_id"
    t.bigint "check_id"
    t.index ["check_id"], name: "index_declaration_checks_on_check_id"
    t.index ["transaction_id"], name: "index_declaration_checks_on_transaction_id"
  end

  create_table "declarations", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "box_name"
    t.float "amount"
    t.bigint "entity_id"
    t.string "type_of_project"
    t.index ["entity_id"], name: "index_declarations_on_entity_id"
  end

  create_table "entities", force: :cascade do |t|
    t.string "name"
    t.string "adress"
    t.string "postal_code"
    t.string "city"
    t.string "vat_number"
    t.string "jurisdiction"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "company_id"
    t.index ["company_id"], name: "index_entities_on_company_id"
  end

  create_table "tax_codes", force: :cascade do |t|
    t.string "jurisdiction"
    t.string "name"
    t.string "tax_code"
    t.float "rate"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.float "gross_amount"
    t.float "net_amount"
    t.float "vat_amount"
    t.string "business_partner_vat_number"
    t.string "business_partner_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "declaration_id"
    t.bigint "assigned_tax_code_id"
    t.date "transaction_date"
    t.index ["assigned_tax_code_id"], name: "index_transactions_on_assigned_tax_code_id"
    t.index ["declaration_id"], name: "index_transactions_on_declaration_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "company_id"
    t.string "first_name"
    t.string "last_name"
    t.index ["company_id"], name: "index_users_on_company_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "assigned_tax_codes", "entities"
  add_foreign_key "declaration_checks", "checks"
  add_foreign_key "declaration_checks", "transactions"
  add_foreign_key "declarations", "entities"
  add_foreign_key "entities", "companies"
  add_foreign_key "transactions", "assigned_tax_codes"
  add_foreign_key "transactions", "declarations"
  add_foreign_key "users", "companies"
end
