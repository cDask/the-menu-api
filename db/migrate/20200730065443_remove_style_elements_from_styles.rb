class RemoveStyleElementsFromStyles < ActiveRecord::Migration[6.0]
  def change
    remove_column :styles, :background, :string
    remove_column :styles, :foreground, :string
    remove_column :styles, :color, :string
    remove_column :styles, :border, :string
    remove_column :styles, :header, :string
  end
end
