100.times do
  author = FactoryBot.create(:author)

  FactoryBot.create_list(:book, (5..10).to_a.sample, author: author)
end
