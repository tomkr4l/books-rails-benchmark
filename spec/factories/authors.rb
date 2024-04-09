FactoryBot.define do
  factory :author do
    name { Faker::Book.author }
    birth { Date.current - rand(100000) }
  end
end
