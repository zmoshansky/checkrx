class CreateRxAlerts < ActiveRecord::Migration
  def change
    create_table :rx_alerts do |t|
      t.integer :din
      t.string :brand_name
      t.string :generic_name
      t.references :pharmacy
      t.datetime :expected_restock
      t.column :availability, "ENUM('avail', 'low', 'out')"

      t.timestamps
    end
    add_index :rx_alerts, :pharmacy_id
  end
end
