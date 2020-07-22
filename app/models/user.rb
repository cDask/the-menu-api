class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :full_name, presence: true
  has_many :restaurants
end
