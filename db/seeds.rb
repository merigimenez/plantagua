require 'open-uri'
require 'json'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts 'Cleaning Database'
User.destroy_all
Plant.destroy_all
Garden.destroy_all

puts 'Creating Plants'
trefle_token = '4oi05SBpTozWwS50K7L0z6JKu4RBmark17I-Qiq9gUg'
pages = 1 #(1..21_863)
#pages.each do |page|
  file = URI.open("https://trefle.io/api/v1/plants?token=#{trefle_token}&page=#{pages}").read
  info = JSON.parse(file)
  final= info["data"]
  final.each do |plant|
    Plant.new(
      { name: plant["common_name"],
        frequency: rand(2..25),
        outdoor: [true, false].sample,
        last_day: Date.today,
        image: plant["image_url"],
        synonyms: plant["synonyms"] }
    )
  end
#end

puts 'Creating users'
Gen = User.create(
  email: 'gen@gen.com',
  password: '12345678',
  full_name: 'Gen'
)

puts 'Creating gardens'
Garden_home = Garden.create(
  name: 'My test garden',
  location: 'Barcelona',
)

puts 'Creating gardens'
Garden_test = Garden.create(
  name: 'My test garden',
  location: 'Barcelona',
)

puts 'Creating gardens'
Garden_lima = Garden.create(
  name: 'My test garden',
  location: 'Barcelona',
)
