class Tag < ApplicationRecord
  TAGGABLE_MODELS = %w[CategorizationQuiz FlashCard OrderingQuiz Quiz].freeze

  normalizes :name, with: ->(name) { name.titleize.strip }

  has_many :tag_maps, dependent: :destroy

  TAGGABLE_MODELS.each do |model|
    has_many model.downcase.pluralize.to_sym, through: :tag_maps, source: :taggable, source_type: model
  end

  validates :name, presence: false, uniqueness: true
  validates :tag_type, presence: true

  enum :tag_type, { display: 0, meta: 1 }
end
