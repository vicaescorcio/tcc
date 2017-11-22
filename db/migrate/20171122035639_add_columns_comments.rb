class AddColumnsComments < ActiveRecord::Migration[5.1]
  def self.up
    add_column :comments, :member_id, :integer
    add_column :comments, :idea_id, :integer
  end

  def self.down
    add_column :comments, :member_id
    add_column :comments, :idea_id
  end
end
