class MovieSerializer < ActiveModel::Serializer
  attributes :id, :title, :year, :synopsis
end
