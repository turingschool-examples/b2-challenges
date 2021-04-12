ActiveRecord::Schema.define(version: 2021_04_05_174543) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "amusement_parks", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mechanic_rides", force: :cascade do |t|
    t.bigint "mechanic_id"
    t.bigint "ride_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mechanic_id"], name: "index_mechanic_rides_on_mechanic_id"
    t.index ["ride_id"], name: "index_mechanic_rides_on_ride_id"
  end

  create_table "mechanics", force: :cascade do |t|
    t.string "name"
    t.integer "years_experience"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rides", force: :cascade do |t|
    t.string "name"
    t.integer "thrill_rating"
    t.boolean "ride_open"
    t.integer "amusement_park_id"
    t.index ["amusement_park_id"], name: "index_rides_on_amusement_park_id"
  end

  add_foreign_key "mechanic_rides", "mechanics"
  add_foreign_key "mechanic_rides", "rides"
end
