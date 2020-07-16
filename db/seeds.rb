# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Populate Users
User.destroy_all
User.create!(name: 'Ben', email: 'ben@email.com', password: 'password')
User.create!(name: 'Emma', email: 'emma@email.com', password: 'password')
User.create!(name: 'Ruth', email: 'ruth@email.com', password: 'password')
User.create!(name: 'Beth', email: 'beth@email.com', password: 'password')
User.create!(name: 'Ryan', email: 'ryan@email.com', password: 'password')
