FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { 'one@test.com' }
    password { 'supersecret' }
  end
end