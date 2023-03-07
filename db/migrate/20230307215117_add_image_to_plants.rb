class AddImageToPlants < ActiveRecord::Migration[7.0]
  def change
    add_column :plants, :image, :string
  end
end
