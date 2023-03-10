class ChangeFrequencyToJsonOnPlants < ActiveRecord::Migration[7.0]
  def change
    remove_column :plants, :frequency, :integer
    add_column :plants, :frequency, :jsonb
  end
end
