class CreateCharacters < ActiveRecord::Migration[5.2]
  def change
    create_table :characters do |t|
      t.string :name
      t.string :gender
      t.string :age
      t.string :eye_color
      t.string :hair_color
      t.references :film, foreign_key: true
      t.references :character_type, foreign_key: true

      t.timestamps
    end
  end
end
