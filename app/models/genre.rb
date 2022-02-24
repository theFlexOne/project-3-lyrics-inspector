class Genre < ActiveRecord::Base
  has_many :tracks
  has_many :albums, through: :tracks
  has_many :playlists, through: :tracks
end
