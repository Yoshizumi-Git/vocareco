class CreateMusics < ActiveRecord::Migration
  def change
    create_table :musics do |t|
      t.string :title
      t.string :image_url
      t.timestamps null: false
    end
  end
end
