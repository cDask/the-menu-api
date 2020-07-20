class AddTagRefToItemTag < ActiveRecord::Migration[6.0]
  def change
    add_reference :item_tags, :tag, null: false, foreign_key: true
  end
end
