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
Notification.destroy_all

puts 'Creating Plants'
# trefle_token = '4oi05SBpTozWwS50K7L0z6JKu4RBmark17I-Qiq9gUg'
# pages = (1..3) #(1..21_863)
# pages.each do |page|
  # file = URI.open("https://trefle.io/api/v1/plants?token=#{trefle_token}&page=#{page}").read
  file = File.read("db/join_plants.json")
  info = JSON.parse(file)
  final = info["data"]
  final.each do |plant|
    Plant.create!(
      name: plant["common_name"],
      scientific_name: plant["scientific_name"],
      frequency: plant["frequency"],
      image: plant["image"]
      # synonyms: plant["synonyms"]
    )
  end
# end

puts 'Creating users'
user_gen = User.create(
  email: 'genwarthon@gmail.com',
  password: '12345678',
  full_name: 'Genevieve Warthon',
  notification_time: '19:00:00.00'
)

puts 'Creating users'
user_ani = User.create(
  email: 'anaisw@gmail.com',
  password: '12345678',
  full_name: 'Anais Warthon',
  notification_time: '19:00:00.00'
)

puts 'Creating gardens'
garden_home= Garden.create(
  name: 'Home Garden',
  location: 'Barcelona, Spain'
)
garden_fruit = Garden.create(
  name: 'Fruit Garden',
  location: 'Barcelona, Spain'
)

puts 'Creating garden plants for garden 1'
garden_plant = GardenPlant.create(
  garden_id: garden_home.id,
  plant_id: Plant.all[0].id,
  name: Plant.all[0].name,
  # photo: Plant.all[0].image,
  last_day: Date.today - rand(1..5),
  outdoor: [true, false].sample
)
garden_plant = GardenPlant.create(
  garden_id: garden_home.id,
  plant_id: Plant.all[1].id,
  name: Plant.all[1].name,
  # photo: Plant.all[1].image,
  last_day: Date.today - rand(1..5),
  outdoor: [true, false].sample
)
garden_plant = GardenPlant.create(
  garden_id: garden_home.id,
  plant_id: Plant.all[2].id,
  name: Plant.all[2].name,
  # photo: Plant.all[2].image,
  last_day: Date.today - rand(1..5),
  outdoor: [true, false].sample
)
garden_plant = GardenPlant.create(
  garden_id: garden_home.id,
  plant_id: Plant.all[3].id,
  name: Plant.all[3].name,
  # photo: Plant.all[3].image,
  last_day: Date.today - rand(1..5),
  outdoor: [true, false].sample
)
garden_plant = GardenPlant.create(
  garden_id: garden_home.id,
  plant_id: Plant.all[4].id,
  name: Plant.all[4].name,
  # photo: Plant.all[4].image,
  last_day: Date.today - rand(1..5),
  outdoor: [true, false].sample
)
garden_plant = GardenPlant.create(
  garden_id: garden_home.id,
  plant_id: Plant.all[5].id,
  name: Plant.all[5].name,
  # photo: Plant.all[5].image,
  last_day: Date.today - rand(1..5),
  outdoor: [true, false].sample
)
garden_plant = GardenPlant.create(
  garden_id: garden_home.id,
  plant_id: Plant.all[6].id,
  name: Plant.all[6].name,
  # photo: Plant.all[6].image,
  last_day: Date.today - rand(1..5),
  outdoor: [true, false].sample
)
garden_plant = GardenPlant.create(
  garden_id: garden_home.id,
  plant_id: Plant.all[7].id,
  name: Plant.all[7].name,
  # photo: Plant.all[7].image,
  last_day: Date.today - rand(1..5),
  outdoor: [true, false].sample
)
garden_plant = GardenPlant.create(
  garden_id: garden_home.id,
  plant_id: Plant.all[8].id,
  name: Plant.all[8].name,
  # photo: Plant.all[8].image,
  last_day: Date.today - rand(1..5),
  outdoor: [true, false].sample
)
garden_plant = GardenPlant.create(
  garden_id: garden_home.id,
  plant_id: Plant.all[9].id,
  name: Plant.all[9].name,
  # photo: Plant.all[9].image,
  last_day: Date.today - rand(1..5),
  outdoor: [true, false].sample
)

puts 'Creating garden plants for garden 2'
garden_plant = GardenPlant.create(
  garden_id: garden_fruit.id,
  plant_id: Plant.all[10].id,
  name: Plant.all[10].name,
  # photo: Plant.all[10].image,
  last_day: Date.today - rand(1..5),
  outdoor: [true, false].sample
)
garden_plant = GardenPlant.create(
  garden_id: garden_fruit.id,
  plant_id: Plant.all[11].id,
  name: Plant.all[11].name,
  # photo: Plant.all[11].image,
  last_day: Date.today - rand(1..5),
  outdoor: [true, false].sample
)
garden_plant = GardenPlant.create(
  garden_id: garden_fruit.id,
  plant_id: Plant.all[12].id,
  name: Plant.all[12].name,
  # photo: Plant.all[12].image,
  last_day: Date.today - rand(1..5),
  outdoor: [true, false].sample
)
garden_plant = GardenPlant.create(
  garden_id: garden_fruit.id,
  plant_id: Plant.all[13].id,
  name: Plant.all[13].name,
  # photo: Plant.all[13].image,
  last_day: Date.today - rand(1..5),
  outdoor: [true, false].sample
)

puts 'Creating link 1 user_garden to home'
garden_plant = UserGarden.create(
  garden_id: garden_home.id,
  user_id: user_gen.id
)

puts 'Creating link 2 user_garden to home'
garden_plant = UserGarden.create(
  garden_id: garden_home.id,
  user_id: user_ani.id
)

puts 'Creating link 1 user_garden to fruit'
garden_plant = UserGarden.create(
  garden_id: garden_fruit.id,
  user_id: user_gen.id
)

notification_first = Notification.create(
  user_id: User.first.id,
  garden_plant_id: GardenPlant.first.id
)
