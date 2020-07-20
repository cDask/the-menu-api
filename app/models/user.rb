class User < ApplicationRecord
  validates :email, presence: true
  validates :password_digest, presence: true
  validates :password_digest, length: { minimum: 8 }
  validates :full_name, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end
