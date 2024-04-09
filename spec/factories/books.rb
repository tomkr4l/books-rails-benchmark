FactoryBot.define do
  factory :book do
    title { "#{Faker::Book.title} (#{SecureRandom.hex(2)})" }
    year_published { (1638..Date.current.year).to_a.sample }
    isbn { Faker::Code.isbn }
    price { Faker::Commerce.price }
    author
  end
end
