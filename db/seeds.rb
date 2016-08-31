require "faker"

User.delete_all
Vote.delete_all
Question.delete_all
Answer.delete_all
Comment.delete_all

20.times do
  User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, hashed_password: "password")
end

20.times do
  Question.create!(text: "#{Faker::Lorem.sentence}?", user_id: rand(1..20))
end

20.times do
  Answer.create!(text: Faker::Lorem.sentence, question_id: rand(1..20),user_id: rand(1..20))
end
