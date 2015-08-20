class AddKeepaliveColumnAtToToilets < ActiveRecord::Migration
  def change
    add_column :toilets, 'last_keep_alive_at', :timestamp

    Toilet.reset_column_information
  end
end
