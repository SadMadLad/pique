class OrderingItem < ApplicationRecord
  belongs_to :ordering_quiz

  validates_presence_of :correct_order, :description
  validates :correct_order, uniqueness: { scope: :ordering_quiz_id }, comparison: { greater_than_or_equal_to: 1, less_than_or_equal_to: :"ordering_quiz.ordering_items"}
end
