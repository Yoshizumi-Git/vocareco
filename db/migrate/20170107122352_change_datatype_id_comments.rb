class ChangeDatatypeIdComments < ActiveRecord::Migration
  def change
    change_column :comments, :user_id, :integer
    change_column :comments, :music_id, :integer
  end
end
