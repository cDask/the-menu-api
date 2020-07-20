class Menu < ApplicationRecord
  validates :title, presence: true
  belongs_to :restaurant
end
