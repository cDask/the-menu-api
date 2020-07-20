class Restaurant < ApplicationRecord
  validates :name, presence: true
  validates :subdomain, presence: true, uniqueness: true
  validates :opening_hours, presence: true, format: { with: /{*}/, message: 'json only baby' }
  belongs_to :user
end
