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

ActiveRecord::Schema.define(version: 2021_02_18_032112) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "professor_students", force: :cascade do |t|
    t.bigint "professor_id"
    t.bigint "student_id"
    t.index ["professor_id"], name: "index_professor_students_on_professor_id"
    t.index ["student_id"], name: "index_professor_students_on_student_id"
  end

  create_table "professors", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.string "specialty"
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.integer "age"
  end

  add_foreign_key "professor_students", "professors"
  add_foreign_key "professor_students", "students"
end
