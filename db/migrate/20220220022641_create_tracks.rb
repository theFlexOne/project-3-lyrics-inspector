class CreateTracks < ActiveRecord::Migration[6.1]
  def change
    create_table :tracks do |t|
      t.integer :album_id
      t.integer :artist_id
      t.string :name
      t.string :spotify_id
      t.integer :duration
      t.string :lyrics
    end
  end
end
