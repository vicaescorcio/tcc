class AddReferencesToComments < ActiveRecord::Migration[5.1]
  def self.up
    add_column :comments, :commentable_id, :integer
    add_column :comments, :commentable_type, :string
    add_index :comments,[:commentable_type,:commentable_id]
  end

  def self.down
    remove_column :comments, :commentable_id
    remove_column :comments, :commentable_type 
    remove_index :comments,[:commentable_type,:commentable_id]
  end
end
