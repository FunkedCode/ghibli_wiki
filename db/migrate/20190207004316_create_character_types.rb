class CreateCharacterTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :character_types do |t|
      t.string :name
      t.string :classification
      t.string :eye_colors
      t.string :hair_colors

      t.timestamps
    end
  end
end
