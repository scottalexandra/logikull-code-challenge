class Album < ApplicationRecord
  belongs_to :artist
  validates_presence_of :title, :year, :condition
  validates_uniqueness_of :title
end
