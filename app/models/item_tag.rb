class ItemTag < ApplicationRecord
  validates :primary, presence: true
end
