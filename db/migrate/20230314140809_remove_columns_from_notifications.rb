class RemoveColumnsFromNotifications < ActiveRecord::Migration[7.0]
  def change
    remove_reference :notifications, :garden_plant
  end
end
