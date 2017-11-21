class CreateIdeas < ActiveRecord::Migration[5.1]
  def change
    create_table :ideas do |t|
      t.string :title
      t.string :describe
      t.integer :support
      t.string :local

      t.timestamps
    end
  end
end
