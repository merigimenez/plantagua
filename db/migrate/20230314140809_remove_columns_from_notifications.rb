class RemoveColumnsFromNotifications < ActiveRecord::Migration[7.0]
  def change
    remove_column :notifications, :notification_type, :integer
    remove_reference :notifications, :garden_plant
  end
end
