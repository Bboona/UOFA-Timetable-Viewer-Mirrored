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

ActiveRecord::Schema.define(version: 2021_09_06_070931) do

  create_table "activities", force: :cascade do |t|
    t.text "class_name"
    t.string "class_code"
    t.text "colour"
    t.text "description"
    t.text "weeks"
    t.text "days"
    t.text "hours"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "Hamming_Weight"
  end

  create_table "activities_teachers", id: false, force: :cascade do |t|
    t.integer "activity_id", null: false
    t.integer "teacher_id", null: false
    t.index ["activity_id"], name: "index_activities_teachers_on_activity_id"
    t.index ["teacher_id"], name: "index_activities_teachers_on_teacher_id"
  end

  create_table "restriction_levels", force: :cascade do |t|
    t.integer "level_current"
    t.string "level_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "teachers", force: :cascade do |t|
    t.text "uni_id"
    t.text "first_name"
    t.text "last_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "weeklies", force: :cascade do |t|
    t.text "week"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
