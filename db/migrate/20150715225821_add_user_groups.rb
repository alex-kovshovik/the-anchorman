class AddUserGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
    end

    add_column :users, :group_id, :integer, after: "id"
    add_column :toilets, :group_id, :integer, after: "id"

    add_index :users, :group_id
    add_index :toilets, :group_id
  end
end
