class OrderingQuiz < ApplicationRecord
  include Collectable
  include Favoritable
  include Taggable

  belongs_to :user

  has_many :ordering_items, dependent: :destroy

  validates_presence_of :title, :description

  accepts_nested_attributes_for :ordering_items
end
