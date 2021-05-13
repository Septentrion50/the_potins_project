# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

Faker::Config.locale = 'fr'

User.destroy_all
City.destroy_all
Gossip.destroy_all
Tag.destroy_all
Comment.destroy_all
Like.destroy_all
PrivateMessage.destroy_all

10.times do
  Tag.create!(
    title: Faker::Lorem.paragraph_by_chars(number: rand(3..14))
  )

  City.create!(
    name: Faker::Address.city,
    zip_code: Faker::Address.zip_code
  )

  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    description: Faker::Lorem.paragraph_by_chars(number: rand(100..180)),
    age: Faker::Number.number(digits: 2),
    city: City.all.sample
  )
end

User.create(
  first_name: 'Anonymous',
  last_name: 'Von Rien du Tout',
  email: Faker::Internet.email,
  password: 'anonym',
  description: Faker::Lorem.paragraph_by_chars(number: rand(100..180)),
  age: 0,
  city: City.first
)

Gossip.create!(
  title: Faker::Lorem.paragraph_by_chars(number: rand(3..14)),
  content: Faker::Lorem.paragraph_by_chars(number: rand(10..200)),
  user: User.all.sample,
  tag: Tag.all.sample
)

Comment.create!(
  content: Faker::Lorem.paragraph_by_chars(number: rand(10..40)),
  comment_type: Gossip.all.sample,
  user: User.all.sample
)

19.times do
  Gossip.create!(
    title: Faker::Lorem.paragraph_by_chars(number: rand(3..14)),
    content: Faker::Lorem.paragraph_by_chars(number: rand(10..200)),
    user: User.all.sample,
    tag: Tag.all.sample
  )

  choice = [Gossip.all.sample, Comment.all.sample]
  Comment.create!(
    content: Faker::Lorem.paragraph_by_chars(number: rand(10..40)),
    comment_type: choice.sample,
    user: User.all.sample
  )

  Like.create!(
    user: User.all.sample,
    like_target: choice.sample
  )
end

30.times do
  PrivateMessage.create!(
    content: Faker::Lorem.paragraph_by_chars(number: rand(10..200)),
    sender: User.all.sample,
    recipient: User.all.sample
  )
end

puts 'Base de données remplie !'
