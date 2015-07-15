class AddToiletsAndThrones < ActiveRecord::Migration
  def change
    create_table :toilets do |t|
      t.string :name, null: false
      t.string :description
      t.string :gender, limit: 1 # M or F

      t.timestamps
    end

    create_table :thrones do |t|
      t.integer :toilet_id, null: false
      t.string :name
      t.string :description
    end

    add_index :thrones, :toilet_id

    Toilet.reset_column_information
    Throne.reset_column_information
  end
end
