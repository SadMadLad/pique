class Favorite < ApplicationRecord
  FAVORITABLE_MODELS = %w[].freeze

  belongs_to :user, counter_cache: :favorited_items_count
  belongs_to :favoritable, polymorphic: true, counter_cache: :favorites_count

  validates :favoritable_type, inclusion: { in: FAVORITABLE_MODELS }
  validates :user_id, uniqueness: { scope: %i[favoritable_id favoritable_type] }
end
