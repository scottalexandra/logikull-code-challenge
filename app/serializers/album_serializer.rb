class AlbumSerializer < ActiveModel::Serializer
  attributes :id, :title, :year, :condition
end
