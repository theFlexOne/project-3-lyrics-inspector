class Album < ActiveRecord::Base
  belongs_to :artist
  has_many :tracks
  has_many :album_genres
  has_many :genres, through: :album_genres
  has_many :playlists, through: :tracks
end
