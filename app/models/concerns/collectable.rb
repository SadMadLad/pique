module Collectable
  extend ActiveSupport::Concern

  included do
    has_many :collectable_maps, as: :collectable, dependent: :destroy
    has_many :collections, through: :collectable_maps
    has_many :collected_users, through: :collections, source: :user
  end
end
