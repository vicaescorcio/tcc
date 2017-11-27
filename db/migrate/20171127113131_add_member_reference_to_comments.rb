class AddMemberReferenceToComments < ActiveRecord::Migration[5.1]
  def self.up
    add_column :comments, :member_id, :integer
    add_column :comments, :idea_id, :integer
  end

  def self.down
    remove_column :comments, :member_id
    remove_column :comments, :idea_id
  end
end
