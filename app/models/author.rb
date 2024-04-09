class Author < ApplicationRecord
  has_many :books, dependent: :destroy

  validates :name, presence: true, length: { maximum: 255 }
  validates :birth, presence: true, comparison: { less_than: Date.current }
  validates :death, comparison: { less_than: :birth }, allow_blank: true
end
