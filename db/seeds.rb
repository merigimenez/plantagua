# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts 'Cleaning users from database'
User.destroy_all

puts 'Creating users'
Gen = User.create(
  email: 'gen@gen.com',
  password: '12345678',
  # first_name: 'Gen',
  # last_name: 'W'
)

puts 'Cleaning gardens from database'
Garden.destroy_all

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
