class Track < ActiveRecord::Base
  belongs_to :album
  has_many :playlists
  has_many :artists, through: :album
end
