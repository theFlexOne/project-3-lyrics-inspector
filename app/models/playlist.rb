class Playlist < ActiveRecord::Base
  has_many :tracks
  has_many :albums, through: :tracks
  has_many :genres, through: :tracks
end
