class Genre < ActiveRecord::Base
  has_many :artists
  has_many :albums, through: :albums
end
