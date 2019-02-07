class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :name
      t.string :climate
      t.string :terrain
      t.integer :surface_water
      t.references :film, foreign_key: true

      t.timestamps
    end
  end
end
