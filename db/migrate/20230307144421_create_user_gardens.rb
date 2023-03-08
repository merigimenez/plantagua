class CreateUserGardens < ActiveRecord::Migration[7.0]
  def change
    create_table :user_gardens do |t|
      t.references :garden, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
