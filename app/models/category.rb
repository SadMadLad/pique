class Category < ApplicationRecord
  belongs_to :categorization_quiz

  has_many :category_quiz_items, dependent: :destroy

  validates_presence_of :title

  accepts_nested_attributes_for :category_quiz_items
end
