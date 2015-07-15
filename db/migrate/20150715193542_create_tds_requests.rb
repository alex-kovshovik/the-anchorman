class CreateTdsRequests < ActiveRecord::Migration
  def change
    create_table :tds_requests do |t|
      t.integer :user_id
      t.string :status

      t.timestamps
    end
  end
end
