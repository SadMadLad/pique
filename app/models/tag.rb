class Tag < ApplicationRecord
  TAGGABLE_MODELS = %w[].freeze

  normalizes :tag, with: ->(tag) { tag.titleize.strip }

  has_many :tag_maps, dependent: :destroy

  TAGGABLE_MODELS.each do |model|
    has_many model.downcase.pluralize.to_sym, through: :tag_maps, source: :taggable, source_type: model
  end

  validates :tag, presence: false, uniqueness: true
  validates :tag_type, presence: true

  enum :tag_type, { display: 0, meta: 1 }
end
