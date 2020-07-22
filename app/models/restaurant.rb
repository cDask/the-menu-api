class Restaurant < ApplicationRecord
  before_validation :create_subdomain

  validates :name, presence: true
  validates :subdomain, presence: true, uniqueness: true
  validates :opening_hours, presence: true, format: { with: /{*}/, message: 'json only baby' }

  belongs_to :user
  has_many :contact_infos
  has_many :menus
  has_one :theme, as: :themeable
  has_many :style, as: :styleable

  private

  def create_subdomain
    subdomain ||= name
    self.subdomain = subdomain.downcase.gsub(' ', '') if subdomain
  end
end
