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

football_test = Test.create(
    name: "Football",
    description: "Dare to put your football knowledge to test",
    level: "Intermediate",
    points: 100,
    created_at: Faker::Date.backward(365 * 5),
    updated_at: Faker::Date.backward(365 * 5),
    user: User.find_by(email: "js@winterfell.gov")
)

q1 = Question.create(description: "How many world cup titles does Italy have", test_id: football_test.id, solution_id: 3)
a1_1 = Answer.create(content: "2", question_id: q1.id)
a1_2 = Answer.create(content: "3", question_id: q1.id)
a1_3 = Answer.create(content: "4", question_id: q1.id)
a1_4 = Answer.create(content: "5", question_id: q1.id)
q2 = Question.create(description: "Who won the 2002 World Cup", test_id: football_test.id, solution_id: 1)
a2_1 = Answer.create(content: "Brazil", question_id: q2.id)
a2_2 = Answer.create(content: "Germany", question_id: q2.id)
a2_3 = Answer.create(content: "France", question_id: q2.id)
a2_4 = Answer.create(content: "Italy", question_id: q2.id)
q3 = Question.create(description: "Who scored the winning goal in the 2014 World Cup", test_id: football_test.id, solution_id: 4)
a3_1 = Answer.create(content: "Andre Schurrle", question_id: q3.id)
a3_2 = Answer.create(content: "Toni Kroos", question_id: q3.id)
a3_3 = Answer.create(content: "Thomas Muller", question_id: q3.id)
a3_4 = Answer.create(content: "Mario Gotze", question_id: q3.id)
q4 = Question.create(description: "Who is the most capped player of all time", test_id: football_test.id, solution_id: 1)
a4_1 = Answer.create(content: "Ahmed Hassan of Egypt", question_id: q4.id)
a4_2 = Answer.create(content: "Gianluigi Buffon of Italy", question_id: q4.id)
a4_3 = Answer.create(content: "Iker Casillas of Spain", question_id: q4.id)
a4_4 = Answer.create(content: "Mohamed Al-Deayea of Saudi Arabia", question_id: q4.id)

