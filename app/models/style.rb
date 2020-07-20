class Style < ApplicationRecord
    validates :style_data, presence: true, format: { with: /{*}/, message: 'json only baby' }
end
