class FlashCard < ApplicationRecord
  include Collectable
  include Favoritable
  include Taggable

  belongs_to :user

  has_one_attached :image

  validates :answer, :prompt, presence: true
end
