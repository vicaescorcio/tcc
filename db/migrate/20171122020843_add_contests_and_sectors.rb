class AddContestsAndSectors < ActiveRecord::Migration[5.1]
  def self.up
    create_table :contests_sectors do |t|
      t.references :contest, :sector
    end
  end
  def self.down
    drop_table :contests_sectors
  end
end
