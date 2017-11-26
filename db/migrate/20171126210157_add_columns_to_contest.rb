class AddColumnsToContest < ActiveRecord::Migration[5.1]
  def self.up
    add_column :contests, :latitude, :float
    add_column :contests, :longitude, :float
    add_column :contests, :local, :string
    
  end
  def self.down
    remove_column :contests, :latitude
    remove_column :contests, :longitude
    remove_column :contests, :local 
    
  end
end
