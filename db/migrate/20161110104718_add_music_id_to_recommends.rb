class AddMusicIdToRecommends < ActiveRecord::Migration
  def change
    add_column :recommends, :music_id, :integer
    add_column :recommends, :rating, :float
  end
end
