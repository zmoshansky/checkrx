class AddTextToRxAlert < ActiveRecord::Migration
  def change
    add_column :rx_alerts, :message, :text
  end
end
