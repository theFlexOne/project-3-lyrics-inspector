class AddPlaylistIdColumnToTracks < ActiveRecord::Migration[6.1]
  def change
    add_column :tracks, :playlist_id, :integer
  end
end
