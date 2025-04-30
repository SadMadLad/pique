class CategorizationQuiz < ApplicationRecord
  include Collectable
  include Favoritable
  include Taggable

  belongs_to :user

  has_many :categories, dependent: :destroy
  has_many :category_quiz_items, through: :categories

  validates_presence_of :title, :description

  accepts_nested_attributes_for :categories
end
