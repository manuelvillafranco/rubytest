class Article < ApplicationRecord
  has_many :comments, dependent: :destroy

  validates :title, presence: true, length: { minimum: 5 }
  validates :body, presence: true

  scope :recent, -> { where('created_at >= ?', 1.week.ago) }
end