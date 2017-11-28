class AddContestReferencesToIdeas < ActiveRecord::Migration[5.1]
  def self.up
    add_column :ideas, :contest_id, :integer
  end

  def self.down
    remove_column :ideas, :contest_id
  end
end
