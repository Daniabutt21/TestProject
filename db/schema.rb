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

ActiveRecord::Schema.define(version: 2020_07_15_110938) do

  create_table "admins", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "features", force: :cascade do |t|
    t.string "name"
    t.integer "code"
    t.integer "unit_price"
    t.integer "max_unit_limit"
    t.integer "plan_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["plan_id"], name: "index_features_on_plan_id"
  end

  create_table "plans", force: :cascade do |t|
    t.string "name"
    t.integer "fee"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "subscriptions", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "plan_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["plan_id"], name: "index_subscriptions_on_plan_id"
    t.index ["user_id"], name: "index_subscriptions_on_user_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.integer "payment_date"
    t.integer "total_charges"
    t.boolean "bill_status"
    t.string "resource_type"
    t.integer "resource_id"
    t.string "charge_type"
    t.string "month"
    t.integer "year"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_transactions_on_user_id"
  end

  create_table "usages", force: :cascade do |t|
    t.integer "no_of_units_used"
    t.string "month"
    t.integer "year"
    t.integer "feature_id", null: false
    t.integer "subscription_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["feature_id"], name: "index_usages_on_feature_id"
    t.index ["subscription_id"], name: "index_usages_on_subscription_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "username"
    t.string "billday"
    t.string "usertype"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "features", "plans"
  add_foreign_key "subscriptions", "plans"
  add_foreign_key "subscriptions", "users"
  add_foreign_key "usages", "features"
  add_foreign_key "usages", "subscriptions"
  add_foreign_key "transactions", "users"
end
