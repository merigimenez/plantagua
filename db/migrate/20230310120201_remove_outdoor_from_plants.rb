class RemoveOutdoorFromPlants < ActiveRecord::Migration[7.0]
  def change
    remove_column :plants, :outdoor, :boolean
    add_column :garden_plants, :outdoor, :boolean
  end
end
