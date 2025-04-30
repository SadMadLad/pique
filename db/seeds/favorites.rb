users = [ User.first ] + User.excluding(User.first).sample(3)

users.each do |user|
  random_flash_cards = FlashCard.sample rand(4..8)
  random_collections = Collection.sample rand(3..5)
  random_quizzes = Quiz.sample rand(4..8)

  favorites_hash = (random_flash_cards + random_collections + random_quizzes).map do |item|
    { favoritable: item, user: }
  end

  user.favorites.create favorites_hash
end
