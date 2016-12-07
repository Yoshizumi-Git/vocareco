class RemoveMusic1FromRecommends < ActiveRecord::Migration
  def change
    remove_column :recommends, :music1, :integer
    remove_column :recommends, :music2, :integer
    remove_column :recommends, :music3, :integer
    remove_column :recommends, :music4, :integer
    remove_column :recommends, :music5, :integer
    remove_column :recommends, :music6, :integer
    remove_column :recommends, :music7, :integer
    remove_column :recommends, :music8, :integer
    remove_column :recommends, :music9, :integer
    remove_column :recommends, :music10, :integer
  end
end
