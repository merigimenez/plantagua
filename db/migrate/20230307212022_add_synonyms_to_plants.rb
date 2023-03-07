class AddSynonymsToPlants < ActiveRecord::Migration[7.0]
  def change
    add_column :plants, :synonyms, :text, array: true, default: []
  end
end
