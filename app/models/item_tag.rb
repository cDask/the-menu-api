class ItemTag < ApplicationRecord
  validates :primary, presence: true
  belongs_to :item
  belongs_to :tag
end
