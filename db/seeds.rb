# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
City.destroy_all
PrivateMessage.destroy_all
Like.destroy_all
Tag.destroy_all
Gosssip.destroy_all
Comment.destroy_all



10.times do
  City.create(name: Faker::Address.city, zip_code: Faker::Address.zip_code)
end

10.times do
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::Lorem.paragraph, email: Faker::Internet.email, age: (rand(13..110)), city_id: City.all.sample.id)
end


20.times do
  Gosssip.create(title: Faker::Lorem.sentence, content: Faker::Lorem.paragraph, user_id: User.all.sample.id )
end

10.times do
  Tag.create(title: "##{Faker::Lorem.words}")
end


Gosssip.all.each do |gosssip|
  JoinTableGossipTag.create(tag_id: Tag.all.sample.id, gosssip_id: gosssip.id)
end

20.times do
  JoinTableGossipTag.create(tag_id: Tag.all.sample.id, gosssip_id: Gosssip.all.sample.id)
end

15.times do
  PrivateMessage.create(sender_id: User.all.sample.id, content: Faker::Lorem.paragraph)
end

PrivateMessage.all.each do |private_message|
  Recipient.create(user_id: User.all.sample.id, private_message_id: private_message.id)
end

15.times do
  Recipient.create(user_id: User.all.sample.id, private_message_id: PrivateMessage.all.sample.id)
end


10.times do
  Comment.create(content: Faker::Lorem.paragraph, commentable_type: Gosssip, commentable_id: Gosssip.all.sample.id, user_id: User.all.sample.id )
end

# 10.times do
#   Comment.create(content: Faker::Lorem.paragraph, commentable_type: Comment, commentable_id: Comment.all.sample.id, user_id: User.all.sample.id )
# end



10.times do
  Like.create(user_id: User.all.sample.id, likeable_id: Gosssip.all.sample.id, likeable_type: Gosssip)
end

# 10.times do
#   Like.create(user_id: User.all.sample.id, likeable_id: Comment.all.sample.id, likeable_type: comment)
# end
