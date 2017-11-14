class AddRoleToMember < ActiveRecord::Migration[5.1]
  def change
    add_column :members, :role, :integer
  end
end
