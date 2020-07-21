class ContactInfo < ApplicationRecord
  validates :name, presence: true
  validates :info, presence: true
  validates :info_type, inclusion: {
    # TODO: fill in more l8r
    in: ['other', 'link', 'phone number'],
    message: 'that is not a valid type'
  }
  validates :info_type, presence: true
  belongs_to :restaurant
end
