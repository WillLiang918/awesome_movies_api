class MovieSerializer < ActiveModel::Serializer
  attributes :id, :title, :year, :synopsis, actors: :actors
end
