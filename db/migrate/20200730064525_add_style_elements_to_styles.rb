class AddStyleElementsToStyles < ActiveRecord::Migration[6.0]
  def change
    add_column :styles, :background, :string
    add_column :styles, :foreground, :string
    add_column :styles, :color, :string
    add_column :styles, :border, :string
    add_column :styles, :header, :string
  end
end
