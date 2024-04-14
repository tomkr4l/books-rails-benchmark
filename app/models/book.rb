class Book < ApplicationRecord
  belongs_to :author, counter_cache: true

  validates :title, :isbn, presence: true, length: { maximum: 255 }
  validates :year_published, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates_uniqueness_of :title, scope: :author_id

  broadcasts_to ->(book) { 'books' }, inserts_by: :prepend, target: 'books_body', partial: 'books/book'

  def to_s
    title
  end

  ransacker :id_text do
    Arel.sql('books.id::text')
  end

  ransacker :year_published_text do
    Arel.sql('books.year_published::text')
  end
end
