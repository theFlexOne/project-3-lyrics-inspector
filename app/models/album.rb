class Album < ActiveRecord::Base
  belongs_to :artist
  has_one :genre, through: :artist
end
