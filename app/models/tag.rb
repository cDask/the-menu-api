class Tag < ApplicationRecord
  validates :name, presence: true
  has_many :item_tags
  has_many :items, through: :item_tags
end
