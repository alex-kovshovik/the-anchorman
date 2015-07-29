class RenameToiletStatusToState < ActiveRecord::Migration
  def change
    rename_column :toilets, :status, :state if column_exists?(:toilets, :status)
    rename_column :tds_requests, :status, :state if column_exists?(:tds_requests, :status)

    Toilet.reset_column_information
    TdsRequest.reset_column_information
  end
end
