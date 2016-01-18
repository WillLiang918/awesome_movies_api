class MovieSerializer < ActiveModel::Serializer
  attributes :id, :title, :year, :synopsis, poster: :poster , actors: :actors
end
