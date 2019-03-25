# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Test.destroy_all
User.destroy_all
Question.destroy_all
Answer.destroy_all
10.times do
 first_name = Faker::Name.first_name
 last_name = Faker::Name.last_name  
 User.create(
   email: "#{first_name.downcase}.#{last_name.downcase}@example.com",
   password: "password",
   first_name: first_name,
   last_name: last_name,
 )
end
User.create(
 email: "js@winterfell.gov",
 password: "supersecret",
 first_name: "John",
 last_name: "Snow",
 is_admin: true,
 is_teacher: true,
)
users = User.all
20.times do
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

  # load up 5 questions
  5.times do
    question = Faker::Quote.yoda

    q = Question.create(description: question, test_id: Test.last.id, solution_id: rand(1...4))

    # load up 4 answers
    4.times do
      Answer.create(content: "This", question_id: Question.last.id)
      Answer.create(content: "That", question_id: Question.last.id)
      Answer.create(content: "All of the above", question_id: Question.last.id)
      Answer.create(content: "None", question_id: Question.last.id)
    end
  end
end
