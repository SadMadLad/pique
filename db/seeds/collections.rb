user = User.first

random_flash_cards_collection = Collection.create(
  user:,
  title: "Random Flash Cards Collection",
  description: "Random Flash Cards Collection"
)

random_flash_cards = FlashCard.sample(6)
collectable_maps_hash = random_flash_cards.map do |flash_card|
  { collectable_id: flash_card.id, collectable_type: flash_card.class.to_s }
end

random_flash_cards_collection.items.create collectable_maps_hash
