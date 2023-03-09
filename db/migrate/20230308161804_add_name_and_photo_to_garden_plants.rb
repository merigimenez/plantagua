class AddNameAndPhotoToGardenPlants < ActiveRecord::Migration[7.0]
  def change
    add_column :garden_plants, :name, :string
    add_column :garden_plants, :photo, :string
  end
end
