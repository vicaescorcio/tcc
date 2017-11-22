class AddColumnMemberToContest < ActiveRecord::Migration[5.1]
  def self.up
    add_column :contests, :member_id, :integer
  end

  def self.down
    add_column :contests, :member_id
  end
end
