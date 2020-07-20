class Theme < ApplicationRecord
  validates :theme_class, presence: true
  belongs_to :themeable, polymorphic: true
end
