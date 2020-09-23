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

ActiveRecord::Schema.define(version: 2020_09_23_212514) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chatrooms", force: :cascade do |t|
    t.bigint "site_id"
    t.bigint "tour_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["site_id"], name: "index_chatrooms_on_site_id"
    t.index ["tour_id"], name: "index_chatrooms_on_tour_id"
  end

  create_table "cohort_memberships", force: :cascade do |t|
    t.bigint "cohort_id"
    t.bigint "member_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cohort_id"], name: "index_cohort_memberships_on_cohort_id"
    t.index ["member_id"], name: "index_cohort_memberships_on_member_id"
  end

  create_table "cohorts", force: :cascade do |t|
    t.string "name"
    t.date "starts_on"
    t.date "ends_on"
    t.bigint "creator_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["creator_id"], name: "index_cohorts_on_creator_id"
  end

  create_table "messages", force: :cascade do |t|
    t.string "content"
    t.bigint "user_id"
    t.bigint "chatroom_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["chatroom_id"], name: "index_messages_on_chatroom_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "sites", force: :cascade do |t|
    t.string "title"
    t.string "url"
    t.string "description"
    t.string "intro"
    t.string "github"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_sites_on_user_id"
  end

  create_table "tour_participants", force: :cascade do |t|
    t.boolean "is_only_hosting"
    t.bigint "tour_id"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["tour_id"], name: "index_tour_participants_on_tour_id"
    t.index ["user_id"], name: "index_tour_participants_on_user_id"
  end

  create_table "tour_rounds", force: :cascade do |t|
    t.bigint "tour_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["tour_id"], name: "index_tour_rounds_on_tour_id"
  end

  create_table "tour_visits", force: :cascade do |t|
    t.decimal "duration"
    t.bigint "user_id"
    t.bigint "site_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "tour_round_id"
    t.index ["site_id"], name: "index_tour_visits_on_site_id"
    t.index ["user_id"], name: "index_tour_visits_on_user_id"
  end

  create_table "tours", force: :cascade do |t|
    t.string "name"
    t.date "date"
    t.integer "visit_type"
    t.bigint "cohort_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cohort_id"], name: "index_tours_on_cohort_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.integer "user_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["username"], name: "index_users_on_username"
  end

end
