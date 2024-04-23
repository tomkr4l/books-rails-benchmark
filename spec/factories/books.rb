FactoryBot.define do
  factory :book do
    title { "#{Faker::Book.title} (#{SecureRandom.hex(2)})" }
    year_published { Faker::Date.year }
    isbn { Faker::Code.isbn }
    price { Faker::Commerce.price }
    author
  end
end
