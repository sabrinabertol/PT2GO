(1..5).each do |id|
  User.create!(
    email: Faker::Internet.email,
    password: "123456"
  )
end

puts "DB created! :heart_eyes_cat:"

(1..5).each do |id|
    Session.create!(
      name: "yoga",
      description: "cool class, come and check!",
      location: Faker::Address.city,
      date: Faker::Date.between(from: '2020-09-23', to: '2020-12-25'),
      user_id: rand(1..5)
    )
  end
