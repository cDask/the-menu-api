class AddMenuRefToItem < ActiveRecord::Migration[6.0]
  def change
    add_reference :items, :menu, null: false, foreign_key: true
  end
end
