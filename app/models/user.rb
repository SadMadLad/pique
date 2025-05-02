class User < ApplicationRecord
  has_secure_password

  %i[categorization_quizzes collections favorites flash_cards ordering_quizzes quizzes sessions].each do |associated_model|
    has_many associated_model, dependent: :destroy
  end

  Favorite::FAVORITABLE_MODELS.each do |favoritable_model|
    has_many :"favorited_#{favoritable_model.to_s.pluralize}", through: :favorites, source: :favoritable, source_type: favoritable_model
  end

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  enum :role, { user: "user", admin: "admin" }

  validates :first_name, :last_name, presence: true, length: { in: 1..100 }
  validates :email_address, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  def favorites_hash(favoritable_type)
    favorites.where(favoritable_type: favoritable_type.to_s).pluck(:favoritable_id, :id).to_h
  end

  def polymorphic_favorites_hash(favoritables)
    favorites_array = favorites.where(favoritable: favoritables).pluck(:favoritable_id, :favoritable_type, :id)

    favorites_array.each_with_object({}) do |subarray, favorites_hash|
      value = subarray.pop
      favorites_hash[subarray] = value
    end
  end
end
