class AddMovieurlToMusics < ActiveRecord::Migration
  def change
    add_column :musics, :movie_url, :string
  end
end
