class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  enum :role, { user: "user", admin: "admin" }

  validates :first_name, :last_name, presence: true, length: { in: 1..100 }
  validates :email_address, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end
