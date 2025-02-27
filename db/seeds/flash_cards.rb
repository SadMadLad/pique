vocabulary_flash_cards = JSON.parse File.read(Rails.root.join('app', 'assets', 'data', 'flash_cards', 'vocabulary.json'))

random_users = User.sample(5)
vocabulary_flash_cards_hashes = vocabulary_flash_cards.map do |hash_data|
  hash_data.merge(user: random_users.sample)
end

FlashCard.create vocabulary_flash_cards_hashes
