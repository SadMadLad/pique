%w[
  cleanup
  users
  tags
  flash_cards
  collections
  favorites
].each { |seed_file| require_relative Rails.root.join("db", "seeds", seed_file) }
