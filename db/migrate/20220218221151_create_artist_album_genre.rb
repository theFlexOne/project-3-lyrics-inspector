class CreateArtistAlbumGenre < ActiveRecord::Migration[6.1]
  def change
    create_table :artists do |t|
      t.string "name"
      t.integer "genre_id"
      t.integer "album_id"
    end
    create_table :albums do |t|
      t.string "name"
      t.integer "artist_id"
      t.integer "album_id"
    end
    create_table :genres do |t|
      t.string "name"
      t.integer "artist_id"
      t.integer "album_id"
    end
  end
end
