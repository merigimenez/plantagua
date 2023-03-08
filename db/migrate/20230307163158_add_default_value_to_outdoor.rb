class AddDefaultValueToOutdoor < ActiveRecord::Migration[7.0]
  def change
    change_column_default :plants, :outdoor, false
  end
end
