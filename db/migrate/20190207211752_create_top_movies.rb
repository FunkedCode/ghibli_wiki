class CreateTopMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :top_movies do |t|
      t.string :title
      t.integer :rank
      t.string :mal_url
      t.string :image_url
      t.float :mal_score

      t.timestamps
    end
  end
end
