require 'csv'

CSV.foreach("#{Rails.root}/lib/data/actors.csv") do |row|
  Actor.create!(name: row[0])
end

CSV.foreach("#{Rails.root}/lib/data/movies.csv") do |row|
   Movie.create!(
     title: row[0],
     year: row[1],
     poster: File.open("#{Rails.root}/app/assets/images/" + row[2]),
     synopsis: row[3],
   )
end

CSV.foreach("#{Rails.root}/lib/data/casting.csv") do |row|
  row[1].split(", ").each do |actor|
    puts "row: #{row}, actor: #{actor}, movie: #{row[0]}"
    Casting.create!(
      movie_id: Movie.where("title LIKE ?", row[0]).first.id,
      actor_id: Actor.where("name LIKE ?", actor).first.id
    )
  end
end

User.create!(
  name: "Joe User",
  username: "joe_user",
  email: "joe_user@example.com",
  password: "password"
)
