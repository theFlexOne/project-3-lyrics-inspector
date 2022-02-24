class Track < ActiveRecord::Base
  belongs_to :genre
  belongs_to :album
  has_one :artist, through: :album
  has_many :playlists
end
