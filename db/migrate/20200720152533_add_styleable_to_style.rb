class AddStyleableToStyle < ActiveRecord::Migration[6.0]
  def change
    add_reference :styles, :styleable, polymorphic: true, null: false
  end
end
