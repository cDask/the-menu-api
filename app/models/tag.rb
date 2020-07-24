class Tag < ApplicationRecord
  validates :name, presence: true
  has_many :item_tags, dependent: :destroy
  has_many :items, through: :item_tags
end
