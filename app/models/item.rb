class Item < ApplicationRecord
  validates :name, presence: true
  belongs_to :menu
  has_many :ingredients
  has_many :sizes
  has_many :item_tags
  has_many :tags, through: :item_tags
  has_one :theme, as: :themable
  has_many :styles, as: :styleable
  has_one_attached :picture
end
