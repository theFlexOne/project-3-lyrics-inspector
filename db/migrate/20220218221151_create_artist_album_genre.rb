class CreateArtistAlbumGenre < ActiveRecord::Migration[6.1]
  def change
    create_table :artist do |t|
      t.string "name"
      t.integer "genre_id"
      t.integer "album_id"
    end
    create_table :album do |t|
      t.string "name"
      t.integer "artist_id"
      t.integer "album_id"
    end
    create_table :genre do |t|
      t.string "name"
      t.integer "artist_id"
      t.integer "album_id"
    end
  end
end
