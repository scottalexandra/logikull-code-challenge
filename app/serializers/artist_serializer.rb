class ArtistSerializer < ActiveModel::Serializer
  attributes :id, :name, :number_of_albums, :range_of_years, :common_words
  has_many :albums
end
