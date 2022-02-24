class Album < ActiveRecord::Base
  belongs_to :artist
  has_many :tracks
  has_many :genres, through: :tracks
  has_many :playlists, through: :tracks
end
