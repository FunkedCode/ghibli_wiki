class CreateFilms < ActiveRecord::Migration[5.2]
  def change
    create_table :films do |t|
      t.string :title
      t.text :description
      t.string :director
      t.string :producer
      t.date :release_date
      t.int :rt_score

      t.timestamps
    end
  end
end
