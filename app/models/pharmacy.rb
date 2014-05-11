class Pharmacy < ActiveRecord::Base
  attr_accessible :address, :city, :email, :name, :phone, :postal_code
  has_many :users, as: :employable
  has_many :rx_alerts

  def get_rev_sorted_alerts(limit)
    alerts = self.rx_alerts
    rev_sorted_alerts = alerts.sort { |a,b| a.updated_at <=> b.updated_at }
    if limit
      return rev_sorted_alerts[0..limit]
    else
      return rev_sorted_alerts
    end
  end
end
