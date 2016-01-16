# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Movie.create!(
  title: "Spider-Man",
  year: 2002,
  synopsis: "When bitten by a genetically modified spider, a nerdy, shy, and \
awkward high school student gains spider-like abilities that he \
eventually must use to fight evil as a superhero after tragedy \
befalls his family."
)

Actor.create!(name: "Tobey Maguire")
Actor.create!(name: "James Franco")
Casting.create!(movie_id: 1, actor_id: 1)
Casting.create!(movie_id: 1, actor_id: 2)
