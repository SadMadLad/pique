class Collection < ApplicationRecord
  include Collectable
  include Favoritable
  include Taggable

  COLLECTABLE_MODELS = %w[Collection FlashCard Quiz].freeze

  belongs_to :user

  has_many :items, dependent: :destroy, class_name: "CollectableMap"

  COLLECTABLE_MODELS.each do |model|
    has_many model.underscore.pluralize.to_sym, through: :items, source: :collectable, source_type: model
  end

  validates :title, presence: true

  scope :shared, -> { where(public: true) }
end
