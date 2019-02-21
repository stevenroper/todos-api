# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
5.times do |num|
  User.create(
    name: Faker::Name.name,
    email: "test_user#{num + 1}@test.com",
    password: 'abcd1234',
    password_confirmation: 'abcd1234'
  )
end

users = User.all

users.each do |user|
  10.times do
    todo = Todo.create(title: Faker::Job.title, created_by: user.id)
    5.times do
      todo.items.create(name: Faker::Job.key_skill, done: false)
    end
  end
end