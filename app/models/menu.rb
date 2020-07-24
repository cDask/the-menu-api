class Menu < ApplicationRecord
  validates :title, presence: true
  belongs_to :restaurant
  has_many :items, dependent: :destroy
  has_one :theme, as: :themeable, dependent: :destroy
  has_many :styles, as: :styleable, dependent: :destroy
end
