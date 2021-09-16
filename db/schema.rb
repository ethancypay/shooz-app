# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_09_16_044402) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "checkouts", force: :cascade do |t|
    t.bigint "buyer_id"
    t.bigint "listing_id"
    t.bigint "payment_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "sneaker_model_name"
    t.string "state"
    t.integer "amount_cents", default: 0, null: false
    t.string "checkout_session_id"
    t.index ["buyer_id"], name: "index_checkouts_on_buyer_id"
    t.index ["listing_id"], name: "index_checkouts_on_listing_id"
    t.index ["payment_id"], name: "index_checkouts_on_payment_id"
  end

  create_table "listings", force: :cascade do |t|
    t.string "brand"
    t.string "sneaker_model_name"
    t.string "size"
    t.string "condition"
    t.boolean "availability"
    t.bigint "seller_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "gender"
    t.integer "price_cents", default: 0, null: false
    t.index ["seller_id"], name: "index_listings_on_seller_id"
  end

  create_table "payments", force: :cascade do |t|
    t.boolean "success"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "shippingdetails", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "contact"
    t.text "address"
    t.string "city"
    t.string "country"
    t.string "postal"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_shippingdetails_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "checkouts", "listings"
  add_foreign_key "checkouts", "payments"
  add_foreign_key "checkouts", "users", column: "buyer_id"
  add_foreign_key "listings", "users", column: "seller_id"
  add_foreign_key "shippingdetails", "users"
end
