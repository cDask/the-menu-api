class AddThemeableToTheme < ActiveRecord::Migration[6.0]
  def change
    add_reference :themes, :themeable, polymorphic: true, null: false
  end
end
