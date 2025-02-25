%w[
  users
  favorites
  tags
].each { |seed_file| require_relative Rails.root.join("db", "seeds", seed_file) }
