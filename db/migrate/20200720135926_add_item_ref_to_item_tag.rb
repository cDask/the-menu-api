class AddItemRefToItemTag < ActiveRecord::Migration[6.0]
  def change
    add_reference :item_tags, :item, null: false, foreign_key: true
  end
end
