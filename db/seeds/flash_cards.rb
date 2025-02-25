vocabulary_flash_cards = <<~JSON
[
  {
    "answer": "Lawlessness",
    "prompt": "Anarchy",
    "published": true
  },
  {
    "answer": "Supporter of government of Russia, Dictatorship",
    "prompt": "Czarist",
    "published": true
  },
  {
    "answer": "Disruptive, Intended to destabilize",
    "prompt": "Subversive",
    "published": true
  },
  {
    "answer": "Policy of extending a country's power with colonization, military or other means",
    "prompt": "Imperialism",
    "published": true
  },
  {
    "answer": "Belief that all people are equal and should have equal rights",
    "prompt": "Egalitarianism",
    "published": true
  },
  {
    "answer": "Irritation, usually caused by one's pride",
    "prompt": "Pique",
    "published": true
  },
  {
    "answer": "Ask for or try to obtain something from someone",
    "prompt": "Solicit",
    "published": true
  },
  {
    "answer": "Liking because of similarity in qualities",
    "prompt": "Congenial",
    "published": true
  },
  {
    "answer": "Hasty, casual, not thorough",
    "prompt": "Cursory",
    "published": true
  },
  {
    "answer": "Bias towards, stong liking towards something",
    "prompt": "Predilection",
    "published": true
  },
  {
    "answer": "Hesitate, Be unwilling the accept",
    "prompt": "Balk",
    "published": true
  },
  {
    "answer": "Abstain from",
    "prompt": "Eschew",
    "published": true
  },
  {
    "answer": "Sanctity of Life, The fact of having to be respected",
    "prompt": "Inviolability",
    "published": true
  },
  {
    "answer": "Having limited or narrow outlook",
    "prompt": "Parochial",
    "published": true
  },
  {
    "answer": "Pointless or Unnecessary",
    "prompt": "Infructuous",
    "published": true
  }
]
JSON

random_users = User.sample(5)
vocabulary_flash_cards_hashes = JSON.parse(vocabulary_flash_cards).map { |hash_data| hash_data.merge(user: random_users.sample) }

FlashCard.create vocabulary_flash_cards_hashes
