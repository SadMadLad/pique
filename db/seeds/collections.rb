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

# ----

random_quizzes_collection = Collection.create(
  user:,
  title: "Random Quizzes Collection",
  description: "Random Quizzes Collection"
)

random_quizzes = Quiz.sample(6)
collectable_maps_hash = random_quizzes.map do |quiz|
  { collectable_id: quiz.id, collectable_type: quiz.class.to_s }
end

random_quizzes_collection.items.create collectable_maps_hash

# ---

random_collection = Collection.create(
  user:,
  title: "Completely random collection",
  description: "Completely random collection"
)

random_items = Quiz.sample(3) + FlashCard.sample(3) + [random_flash_cards_collection, random_quizzes_collection]
collectable_maps_hash = random_items.map do |item|
  { collectable_id: item.id, collectable_type: item.class.to_s }
end

random_collection.items.create collectable_maps_hash
