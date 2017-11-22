class AddColumnMemberToIdea < ActiveRecord::Migration[5.1]
  def self.up
    add_column :ideas, :member_id, :integer
  end

  def self.down
    add_column :ideas, :member_id
  end
end
