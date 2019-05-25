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

ActiveRecord::Schema.define(version: 2019_05_24_162917) do

  create_table "auditoriums", force: :cascade do |t|
    t.string "name"
    t.integer "server_id"
    t.integer "university_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.string "slug_en"
    t.string "slug_uk"
    t.index ["slug"], name: "index_auditoriums_on_slug", unique: true
    t.index ["slug_en"], name: "index_auditoriums_on_slug_en"
    t.index ["slug_uk"], name: "index_auditoriums_on_slug_uk"
    t.index ["university_id"], name: "index_auditoriums_on_university_id"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.integer "server_id"
    t.integer "university_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.string "slug_en"
    t.string "slug_uk"
    t.index ["slug"], name: "index_groups_on_slug"
    t.index ["slug_en"], name: "index_groups_on_slug_en"
    t.index ["slug_uk"], name: "index_groups_on_slug_uk"
    t.index ["university_id"], name: "index_groups_on_university_id"
  end

  create_table "groups_records", id: false, force: :cascade do |t|
    t.integer "group_id"
    t.integer "record_id"
    t.index ["group_id"], name: "index_groups_records_on_group_id"
    t.index ["record_id"], name: "index_groups_records_on_record_id"
  end

  create_table "records", force: :cascade do |t|
    t.datetime "start_date"
    t.string "name"
    t.string "pair_name"
    t.string "reason"
    t.string "kind"
    t.string "time"
    t.integer "auditorium_id"
    t.integer "teacher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "university_id"
    t.datetime "pair_start_date"
    t.index ["auditorium_id"], name: "index_records_on_auditorium_id"
    t.index ["teacher_id"], name: "index_records_on_teacher_id"
    t.index ["university_id"], name: "index_records_on_university_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.string "name"
    t.integer "server_id"
    t.integer "university_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.string "slug_en"
    t.string "slug_uk"
    t.index ["slug"], name: "index_teachers_on_slug", unique: true
    t.index ["slug_en"], name: "index_teachers_on_slug_en"
    t.index ["slug_uk"], name: "index_teachers_on_slug_uk"
    t.index ["university_id"], name: "index_teachers_on_university_id"
  end

  create_table "universities", force: :cascade do |t|
    t.string "short_name"
    t.string "full_name"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
