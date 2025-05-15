class OrderingItem < ApplicationRecord
  belongs_to :ordering_quiz

  validates_presence_of :correct_order, :description
  validates :correct_order, uniqueness: { scope: :ordering_quiz_id }

  validate :correct_order_value

  private
    def correct_order_value
      ordering_items_size = ordering_quiz.ordering_items.size
      return if correct_order.between?(1, ordering_items_size)

      errors.add(:correct_order, "must be between 1 and #{ordering_items_size}")
    end
end
