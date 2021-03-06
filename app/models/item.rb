class Item < ApplicationRecord
  validates :name, presence: true
  belongs_to :menu
  has_many :ingredients, dependent: :destroy
  has_many :sizes, dependent: :destroy
  has_many :item_tags, dependent: :destroy
  has_many :tags, through: :item_tags
  has_one :theme, as: :themeable, dependent: :destroy
  has_one :style, as: :styleable, dependent: :destroy
  has_one_attached :picture
end
