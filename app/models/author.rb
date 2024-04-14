class Author < ApplicationRecord
  has_many :books, dependent: :destroy

  validates :name, presence: true, length: { maximum: 255 }
  validates :birth, presence: true, comparison: { less_than: Date.current }
  validates :death, comparison: { greater_than: :birth }, allow_blank: true

  def to_s
    name
  end

  ransacker :id_text do
    Arel.sql('authors.id::text')
  end
end
