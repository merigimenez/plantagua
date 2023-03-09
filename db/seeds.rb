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
UserGarden.destroy_all
GardenPlant.destroy_all
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
    Plant.create(
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
user_gen = User.create(
  email: 'gen@gmail.com',
  password: '12345678',
  full_name: 'Genevieve Warthon',
  notification_time: '19:00:00.00'
)

puts 'Creating users'
user_ani = User.create(
  email: 'anais@gmail.com',
  password: '12345678',
  full_name: 'Anais Warthon',
  notification_time: '19:00:00.00'
)

puts 'Creating gardens'
garden_home= Garden.create(
  name: 'Home Garden',
  location: 'Barcelona, Spain',
)
garden_fruit = Garden.create(
  name: 'Fruit Garden',
  location: 'Cuzco, Peru',
)


puts 'Creating garden plants for garden 1'
garden_plant = GardenPlant.create(
  garden_id: garden_home.id,
  plant_id: Plant.find(1).id,
  name: Plant.find(1).name,
  photo: Plant.find(1).image,
)
garden_plant = GardenPlant.create(
  garden_id: garden_home.id,
  plant_id: Plant.find(2).id,
  name: Plant.find(2).name,
  photo: Plant.find(2).image,
)
garden_plant = GardenPlant.create(
  garden_id: garden_home.id,
  plant_id: Plant.find(3).id,
  name: Plant.find(3).name,
  photo: Plant.find(3).image,
)
garden_plant = GardenPlant.create(
  garden_id: garden_home.id,
  plant_id: Plant.find(4).id,
  name: Plant.find(4).name,
  photo: Plant.find(4).image,
)
garden_plant = GardenPlant.create(
  garden_id: garden_home.id,
  plant_id: Plant.find(5).id,
  name: Plant.find(5).name,
  photo: Plant.find(5).image,
)
garden_plant = GardenPlant.create(
  garden_id: garden_home.id,
  plant_id: Plant.find(6).id,
  name: Plant.find(6).name,
  photo: Plant.find(6).image,
)
garden_plant = GardenPlant.create(
  garden_id: garden_home.id,
  plant_id: Plant.find(7).id,
  name: Plant.find(7).name,
  photo: Plant.find(7).image,
)
garden_plant = GardenPlant.create(
  garden_id: garden_home.id,
  plant_id: Plant.find(8).id,
  name: Plant.find(8).name,
  photo: Plant.find(8).image,
)
garden_plant = GardenPlant.create(
  garden_id: garden_home.id,
  plant_id: Plant.find(9).id,
  name: Plant.find(9).name,
  photo: Plant.find(9).image,
)
garden_plant = GardenPlant.create(
  garden_id: garden_home.id,
  plant_id: Plant.find(10).id,
  name: Plant.find(10).name,
  photo: Plant.find(10).image,
)

puts 'Creating garden plants for garden 2'
garden_plant = GardenPlant.create(
  garden_id: garden_fruit.id,
  plant_id: Plant.find(11).id,
  name: Plant.find(11).name,
  photo: Plant.find(11).image,
)
garden_plant = GardenPlant.create(
  garden_id: garden_fruit.id,
  plant_id: Plant.find(12).id,
  name: Plant.find(12).name,
  photo: Plant.find(12).image,
)
garden_plant = GardenPlant.create(
  garden_id: garden_fruit.id,
  plant_id: Plant.find(13).id,
  name: Plant.find(13).name,
  photo: Plant.find(13).image,
)
garden_plant = GardenPlant.create(
  garden_id: garden_fruit.id,
  plant_id: Plant.find(14).id,
  name: Plant.find(14).name,
  photo: Plant.find(14).image,
)


puts 'Creating link 1 user_garden'
garden_plant = UserGarden.create(
  garden_id: garden_home.id,
  user_id: user_gen.id,
)

puts 'Creating link 2 user_garden'
garden_plant = UserGarden.create(
  garden_id: garden_home.id,
  user_id: user_ani.id,
)
