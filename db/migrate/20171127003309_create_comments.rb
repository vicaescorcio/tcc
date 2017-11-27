class CreateComments < ActiveRecord::Migration[5.1]
  def self.up
    create_table :comments do |t|
      t.string :title, :limit => 50, :default => "" 
      t.text :comment
      t.references :commentable, :polymorphic => true
      t.references :member
      t.string :role, :default => "comments"
      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end
