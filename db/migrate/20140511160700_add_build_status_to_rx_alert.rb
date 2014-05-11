class AddBuildStatusToRxAlert < ActiveRecord::Migration
  def up
    add_column :rx_alerts, :build_status, :string
  end

  def down
    remove_column :rx_alerts, :build_status
  end
end
