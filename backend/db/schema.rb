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

ActiveRecord::Schema.define(version: 2021_08_25_124746) do

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.string "author"
    t.string "publisher"
    t.string "genre"
  end

  create_table "comments", force: :cascade do |t|
    t.string "text"
    t.integer "member_id"
    t.integer "book_id"
  end

  create_table "comments_members", id: false, force: :cascade do |t|
    t.integer "comment_id", null: false
    t.integer "member_id", null: false
  end

  create_table "members", force: :cascade do |t|
    t.string "name"
    t.string "fav_author"
  end

end
