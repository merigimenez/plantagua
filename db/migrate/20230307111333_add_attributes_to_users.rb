class AddAttributesToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :full_name, :string
    add_column :users, :notification_time, :time
  end
end
