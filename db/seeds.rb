<<<<<<< HEAD
=======
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


>>>>>>> 91c52cdec4ac6191a2059d57a8409dfd15cb3142
(1..5).each do |id|
  User.create!(
    email: Faker::Internet.email,
    password: "123456"
  )
end

<<<<<<< HEAD
puts "DB created! :heart_eyes_cat:"

(1..5).each do |id|
    Session.create!(
      name: "yoga",
=======
puts "DB created! 😻"

(1..5).each do |id|
    Session.create!(
      name: Faker::Esport.event,
>>>>>>> 91c52cdec4ac6191a2059d57a8409dfd15cb3142
      description: "cool class, come and check!",
      location: Faker::Address.city,
      date: Faker::Date.between(from: '2020-09-23', to: '2020-12-25'),
      user_id: rand(1..5)
    )
  end
