# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

puts "cleansing databases"
UserGenre.destroy_all
UserInstrument.destroy_all
Instrument.destroy_all
Genre.destroy_all
User.destroy_all
Conversation.destroy_all
Match.destroy_all

instrument_seed = ["piano","guitar","flute","drums","piano","bass","clarinet","vocalist","electric guitar"]
instrument_seed.each do |instrument|
  Instrument.create!(instrument: instrument)
  puts "added #{instrument}"
end

genre_seed = ["rock","pop","jazz","classical","metal","hip-hop","electronic","indie","acoustic"]
genre_seed.each do |genre|
  Genre.create!(genre: genre)
  puts "added #{genre}"
end

20.times do
  User.create!(
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    name: Faker::Name.name,
    location: "London",
    ability: rand(0..2),
    commitment: rand(0..2),
    about: Faker::Lorem.sentence
  )
  puts "added user"
end

users = User.all

users.each do |user|
  rand = rand(Genre.first.id..Genre.last.id)
  UserGenre.create!(
    user_id: user.id,
    genre_id: rand
  )
  puts "gave user #{user.id} genre"

  UserInstrument.create!(
    user_id: user.id,
    instrument_id: rand
  )
  puts "gave user #{user.id} instrument"
end


Conversation.create(lastmessage: 'Test')


Match.create(
  sender: User.first,
  receiver: User.last,
  senderstatus: true,
  receiverstatus: true,
  conversation: Conversation.first
)

puts "seed complete"
