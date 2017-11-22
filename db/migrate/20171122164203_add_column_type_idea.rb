class AddColumnTypeIdea < ActiveRecord::Migration[5.1]
  def change
    add_column :ideas, :type, :integer
  end
end
