class Track < ActiveRecord::Base
  has_many :playlist_tracks
  has_many :playlists, through: :playlist_tracks
  belongs_to :album
  has_one :artist, through: :album

  def genres
    self.artist.genres
  end
end
