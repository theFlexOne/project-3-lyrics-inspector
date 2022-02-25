class Playlist < ActiveRecord::Base
  has_many :playlist_tracks
  has_many :tracks, through: :playlist_tracks
end
