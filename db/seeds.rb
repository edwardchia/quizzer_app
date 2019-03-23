# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Test.destroy_all
User.destroy_all

10.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  User.create(
    email: "#{first_name.downcase}.#{last_name.downcase}@example.com",
    password: "password",
  )
end

User.create(
  email: "js@winterfell.gov",
  password: "supersecret",
  is_admin: true,
  is_teacher: true,
)

users = User.all

200.times do
  created_at = Faker::Date.backward(365 * 5)

  levels = ["beginner", "intermediate", "advanced"]
  points = Array(1..10)
  p = Test.create(
    name: Faker::Lorem.sentence(3),
    description: Faker::Lorem.paragraph,
    level: levels.sample,
    points: points.sample,
    created_at: created_at,
    updated_at: created_at,
    user: users.sample,
  )
end
