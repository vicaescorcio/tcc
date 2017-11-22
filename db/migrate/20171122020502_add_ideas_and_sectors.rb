class AddIdeasAndSectors < ActiveRecord::Migration[5.1]
  def self.up
    create_table :ideas_sectors do |t|
      t.references :idea, :sector
    end
  end
  def self.down
    drop_table :ideas_sectors
  end
end
