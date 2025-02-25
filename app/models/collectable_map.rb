class CollectableMap < ApplicationRecord
  belongs_to :collection, counter_cache: :items_count
  belongs_to :collectable, polymorphic: true, counter_cache: :collectable_maps_count

  validates :collectable_type, inclusion: { in: Collection::COLLECTABLE_MODELS }
  validates :collection_id, uniqueness: { scope: %i[collectable_id collectable_type] }
end
