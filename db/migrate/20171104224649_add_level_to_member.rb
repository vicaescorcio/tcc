class AddLevelToMember < ActiveRecord::Migration[5.1]
  def change
    add_column :members, :level, :integer
  end
end
