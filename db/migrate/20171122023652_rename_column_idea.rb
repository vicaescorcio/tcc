class RenameColumnIdea < ActiveRecord::Migration[5.1]
  def self.up
    rename_column :ideas, :idea_id, :id
  end
  
  def self.down
    rename_column :ideas, :id, :idea_id
  end
end
