class Collection < ApplicationRecord
  include Favoritable

  COLLECTABLE_MODELS = %w[].freeze

  belongs_to :user

  has_many :items, dependent: :destroy, class_name: 'CollectableMap'

  COLLECTABLE_MODELS.each do |model|
    has_many model.underscore.pluralize.to_sym, through: :items, source: :collectable, source_type: model
  end

  validates :public, boolean: true
  validates :title, presence: true
end
