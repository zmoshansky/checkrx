class AddRoleToUser < ActiveRecord::Migration
  def up
    add_column :users, :employable_id, :integer
    add_column :users, :employable_type, :string
  end

  def down
    remove_column :users, :employable_id
    remove_column :users, :employable_type
  end
end
