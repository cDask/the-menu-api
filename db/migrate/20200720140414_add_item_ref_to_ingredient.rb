class AddItemRefToIngredient < ActiveRecord::Migration[6.0]
  def change
    add_reference :ingredients, :item, null: false, foreign_key: true
  end
end
