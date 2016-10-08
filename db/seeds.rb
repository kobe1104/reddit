# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times do
  User.create(username: "#{Faker::Name.first_name}@gmail.com", password: 111111)
end

10.times do
  Sub.create(title: Faker::Name.title, description: Faker::Name.title, moderator_id: 1)
end
