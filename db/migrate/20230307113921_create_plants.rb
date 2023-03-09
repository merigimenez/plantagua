class CreatePlants < ActiveRecord::Migration[7.0]
  def change
    create_table :plants do |t|
      t.string :name
      t.integer :frequency
      t.boolean :outdoor
      t.date :last_day
      t.timestamps
    end
  end
end
