class CreateToiletsSchema < ActiveRecord::Migration

  def change
    create_table :groups do |t|
      t.string :name

      t.timestamps
    end

    add_index :groups, :name, unique: true

    create_table :toilets do |t|
      t.integer :group_id, null: false
      t.string :state, limit: 32, null: false, default: 'available'
      t.string :name, null: false
      t.string :description
      t.string :gender, null: false, default: 'M', limit: 1

      t.timestamps
    end

    add_index :toilets, [:group_id, :status], name: 'idx_toilets_group_status'

    create_table :tds_requests do |t|
      t.integer :user_id, null: false
      t.integer :toilet_id, null: false
      t.string :state, null: false, default: 'pending'

      t.timestamps
    end

    add_index :tds_requests, :user_id
    add_index :tds_requests, :toilet_id
  end

end
