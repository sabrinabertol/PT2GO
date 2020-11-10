# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


5.times do
  User.create!(
    email: Faker::Internet.email,
    password: "123456"
  )
end

puts "Users created! 😻"

5.times do
  Session.create!(
    name: Faker::Esport.event,
    tipo: Session::TIPO.rand,
    description: "cool class, come and check!",
    location: Faker::Address.city,
    date: Faker::Date.between(from: '2020-09-23', to: '2020-12-25')
  )
end

puts "Classes created! 😻"
