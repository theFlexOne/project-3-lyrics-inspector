class Track < ActiveRecord::Base
  belongs_to :albums
  has_many :artists, through: :albums
end
