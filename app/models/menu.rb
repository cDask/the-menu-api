class Menu < ApplicationRecord
  validates :title, presence: true
  belongs_to :restaurant
  has_many :items
  has_one :theme, as: :themeable
  has_many :styles, as: :styleable
end
