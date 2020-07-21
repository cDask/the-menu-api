class AddRestaurantRefToContactInfo < ActiveRecord::Migration[6.0]
  def change
    add_reference :contact_infos, :restaurant, null: false, foreign_key: true
  end
end
