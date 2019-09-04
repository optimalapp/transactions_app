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

ActiveRecord::Schema.define(version: 2019_08_31_171602) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "transactions", force: :cascade do |t|
    t.decimal "amount", precision: 15, scale: 2
    t.string "status", default: "processed"
    t.integer "user_id"
    t.uuid "uuid"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["uuid"], name: "index_transactions_on_uuid"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "role", default: "merchant"
    t.text "description"
    t.string "email"
    t.string "status", default: "active"
    t.decimal "total_transaction_sum", precision: 15, scale: 2, default: "0.0"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "uuid_extensions", force: :cascade do |t|
  end

end
