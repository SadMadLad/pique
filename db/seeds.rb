%w[ user ].each { |seed_file| require_relative Rails.root.join("db", "seeds", seed_file) }
