class User < ActiveRecord::Base
  has_many :playlists
  has_many :tracks, through: :playlists
  has_many :albums, through: :tracks
  has_many :artists, through: :albums
  has_many :genres, through: :artists
end
