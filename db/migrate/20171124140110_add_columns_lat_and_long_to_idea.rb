class AddColumnsLatAndLongToIdea < ActiveRecord::Migration[5.1]
  def self.up
    add_column :ideas, :latitude, :float
    add_column :ideas, :longitude, :float
  end
  def self.down
    remove_column :ideas, :latitude, :float
    remove_column :ideas, :longitude, :float
  end
end
