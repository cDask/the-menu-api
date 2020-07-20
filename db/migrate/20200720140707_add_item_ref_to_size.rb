class AddItemRefToSize < ActiveRecord::Migration[6.0]
  def change
    add_reference :sizes, :item, null: false, foreign_key: true
  end
end
