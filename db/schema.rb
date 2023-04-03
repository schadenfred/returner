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

ActiveRecord::Schema[7.0].define(version: 2023_04_03_230903) do
  create_table "awards", force: :cascade do |t|
    t.integer "granter_id"
    t.integer "recipient_id"
    t.integer "amount"
    t.string "purpose"
    t.string "tax_period_end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "awards_filings", force: :cascade do |t|
    t.integer "award_id", null: false
    t.integer "filing_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["award_id"], name: "index_awards_filings_on_award_id"
    t.index ["filing_id"], name: "index_awards_filings_on_filing_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "event_type"
    t.date "event_date"
    t.text "title"
    t.string "speaker"
    t.string "host"
    t.boolean "published"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "filings", force: :cascade do |t|
    t.integer "filer_id"
    t.string "return_timestamp"
    t.string "tax_period_end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orgs", force: :cascade do |t|
    t.string "ein"
    t.string "name"
    t.string "address"
    t.string "line_1"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "awards_filings", "awards"
  add_foreign_key "awards_filings", "filings"
end
