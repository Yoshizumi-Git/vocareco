class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :user_id
      t.string :music_id
      t.text   :review
      t.timestamps null: false
    end
  end
end
