class CreateContactInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :contact_infos do |t|
      t.string :name
      t.string :info_type
      t.string :info

      t.timestamps
    end
  end
end
