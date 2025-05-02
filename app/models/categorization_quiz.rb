class CategorizationQuiz < ApplicationRecord
  include Collectable
  include Favoritable
  include Taggable

  belongs_to :user

  has_many :categories, dependent: :destroy
  has_many :category_items, through: :categories

  validates_presence_of :title, :description
  validates :categories, presence: true, length: { minimum: 2 }

  accepts_nested_attributes_for :categories
end
