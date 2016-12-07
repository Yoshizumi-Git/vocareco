class CreateRecommends < ActiveRecord::Migration
  def change
    create_table :recommends do |t|
      t.integer :user_id
      t.integer :music1
      t.integer :music2
      t.integer :music3
      t.integer :music4
      t.integer :music5
      t.integer :music6
      t.integer :music7
      t.integer :music8
      t.integer :music9
      t.integer :music10
      t.timestamps null: false
    end
  end
end
