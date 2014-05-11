class CreateDrugs < ActiveRecord::Migration
  def change
    create_table :drugs do |t|
      t.integer :din
      t.string :brand_name

      t.timestamps
    end
  end
end
