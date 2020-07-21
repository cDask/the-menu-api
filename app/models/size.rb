class Size < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true
  belongs_to :item
end
