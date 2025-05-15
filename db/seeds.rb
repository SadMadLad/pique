
if Rails.env.development?
  %w[
    cleanup
    users
    tags
    flash_cards
    categorization_quizzes
    quizzes
    ordering_quizzes

    collections
    favorites
  ].each { |seed_file| require_relative Rails.root.join("db", "seeds", seed_file) }
end
