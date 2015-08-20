class CreateToiletTransactions < ActiveRecord::Migration
  def change
    create_table :toilet_transactions do |t|
      t.integer :toilet_id, null: false
      t.string :event, limit: 16

      t.timestamps
    end

    add_index :toilet_transactions, [:toilet_id, :created_at]

    ToiletTransaction.reset_column_information
  end
end
