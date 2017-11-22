class RemoveColumnsToComments < ActiveRecord::Migration[5.1]
  def change
    remove_column :comments, :idea_id
    remove_column :comments, :member_id 
  end
end
