class ChangeColumnIdeas < ActiveRecord::Migration[5.1]
  def change
    rename_column :ideas, :type, :kind
  end
end
