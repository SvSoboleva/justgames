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

ActiveRecord::Schema.define(version: 20180314123445) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cages", force: :cascade do |t|
    t.bigint "desk_id"
    t.string "board_id", null: false
    t.string "img_name", null: false
    t.string "img_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["desk_id", "board_id"], name: "index_cages_on_desk_id_and_board_id", unique: true
    t.index ["desk_id"], name: "index_cages_on_desk_id"
  end

  create_table "desks", force: :cascade do |t|
    t.string "token"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "game_name", null: false
    t.index ["user_id"], name: "index_desks_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "body"
    t.bigint "desk_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nickname", null: false
    t.index ["desk_id"], name: "index_messages_on_desk_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "nickname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "cages", "desks"
  add_foreign_key "desks", "users"
  add_foreign_key "messages", "desks"
end
