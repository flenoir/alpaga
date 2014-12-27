class AddUserIdToFormats < ActiveRecord::Migration
  def change
    add_column :formats, :user_id, :integer
    add_index :formats, :user_id
  end
end
