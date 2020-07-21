class CreateItemTags < ActiveRecord::Migration[6.0]
  def change
    create_table :item_tags do |t|
      t.boolean :primary, default: false

      t.timestamps
    end
  end
end
