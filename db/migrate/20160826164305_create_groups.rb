class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :group_name
      t.text :group_description
      t.references :user, index: true

      t.timestamps
    end
  end
end
