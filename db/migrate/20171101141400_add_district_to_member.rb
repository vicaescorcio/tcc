class AddDistrictToMember < ActiveRecord::Migration[5.1]
  def change
    add_column :members, :district, :string
  end
end
