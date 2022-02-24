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

ActiveRecord::Schema.define(version: 2022_02_24_173244) do

  create_table "albums", force: :cascade do |t|
    t.string "name"
    t.string "spotify_id"
    t.datetime "release_date"
    t.integer "artist_id"
  end

  create_table "artists", force: :cascade do |t|
    t.string "name"
    t.string "spotify_id"
    t.integer "popularity"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.string "spotify_id"
  end

  create_table "playlists", force: :cascade do |t|
    t.string "name"
    t.string "spotify_id"
  end

  create_table "tracks", force: :cascade do |t|
    t.string "name"
    t.string "spotify_id"
    t.integer "duration_s"
    t.integer "genre_id"
    t.integer "album_id"
    t.integer "playlist_id"
  end

end
