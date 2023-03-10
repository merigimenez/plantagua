class RemoveLastdayFromPlants < ActiveRecord::Migration[7.0]
  def change
    remove_column :plants, :last_day, :date
    add_column :garden_plants, :last_day, :date
  end
end
