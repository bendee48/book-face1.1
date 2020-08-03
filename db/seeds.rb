# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Populate Users
User.destroy_all
ben = User.create!(name: 'Ben', email: 'ben@email.com', password: 'password')
emma = User.create!(name: 'Emma', email: 'emma@email.com', password: 'password')
ruth = User.create!(name: 'Ruth', email: 'ruth@email.com', password: 'password')
beth = User.create!(name: 'Beth', email: 'beth@email.com', password: 'password')
ryan = User.create!(name: 'Ryan', email: 'ryan@email.com', password: 'password')

#Create Posts
ben.posts.create!(body: "Hello, this is my first post.")
ben.posts.create!(body: "Hello, this is my second post.")
emma.posts.create!(body: "Hello, this is my first post.")
emma.posts.create!(body: "Hello, this is my second post.")
emma.posts.create!(body: "Hello, this is my third post.")
ruth.posts.create!(body: "Hello, this is my first post.")
beth.posts.create!(body: "Hello, this is my first post.")
ryan.posts.create!(body: "Hello, this is my first post.")

#Friends
ben.friends << emma
ben.friends << ryan
emma.friends << beth
emma.friends << ruth
ryan.friends << ruth

#Create Comments
ben.posts.first.comments.create(body: "Nice hippo. Very impressed.", user_id: emma.id)
ben.posts.first.comments.create(body: "I agree. Great hippo.", user_id: ryan.id)
ryan.posts.first.comments.create(body: "Good to know, thanks.", user_id: ruth.id)
emma.posts.second.comments.create(body: "Nice post. How are you?", user_id: beth.id)
emma.posts.second.comments.create(body: "Good thanks!", user_id: emma.id)

#Friend Requests
ben.friend_requests.create(friend_id: beth.id)
ben.friend_requests.create(friend_id: ruth.id)
ruth.friend_requests.create(friend_id: ben.id)
ryan.friend_requests.create(friend_id: beth.id)

#Add Pictures
ben.posts.first.photo.attach(io: File.open('app/assets/images/hippo.jpeg'), filename: 'hippo.jpeg')
ryan.posts.first.photo.attach(io: File.open('app/assets/images/hiphiphorray.jpeg'), filename: 'hiphiphorray.jpeg')
emma.profile_pic.attach(io: File.open('app/assets/images/jenkinsons-aquarium-african-penguin-capt-jack-circle.jpg'), filename: 'penguin.jpg')
