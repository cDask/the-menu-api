class Ingredient < ApplicationRecord
  validates :name, presence: true
  belongs_to :item
end
