module Taggable
  extend ActiveSupport::Concern

  included do
    has_many :tag_maps, as: :taggable, dependent: :destroy
    has_many :tags, through: :tag_maps
  end
end
