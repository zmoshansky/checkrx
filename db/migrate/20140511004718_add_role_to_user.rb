class AddRoleToUser < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.references :employable
    end
  end
end
