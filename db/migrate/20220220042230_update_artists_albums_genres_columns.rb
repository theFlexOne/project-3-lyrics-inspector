class UpdateArtistsAlbumsGenresColumns < ActiveRecord::Migration[6.1]
  def change
    change_table :artists do |t|
      t.remove :album_id
      t.column :spotify_id, :string
      t.column :popularity, :integer
    end
    change_table :albums do |t|
      t.remove :album_id
      t.column :genre_id, :integer
      t.column :spotify_id, :string
      t.column :release_date, :datetime
    end
    change_table :genres do |t|
      t.remove :album_id
      t.remove :artist_id
      t.column :spotify_id, :string
    end
  end
end
