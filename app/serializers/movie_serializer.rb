class MovieSerializer < ActiveModel::Serializer
  attributes :id, :title, :year, :synopsis, :poster, actors: :actors
end
