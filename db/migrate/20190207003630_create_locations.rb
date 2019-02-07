class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :name
      t.string :climate
      t.string :terrain
      t.int :surface_water

      t.timestamps
    end
  end
end
