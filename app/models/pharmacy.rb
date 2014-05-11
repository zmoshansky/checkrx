class Pharmacy < ActiveRecord::Base
  attr_accessible :address, :city, :email, :name, :phone, :postal_code
  has_many :users, as: :employable
  has_many :rx_alerts, inverse_of: :pharmacy

  def get_rev_sorted_alerts(limit)
    alerts = self.rx_alerts
    sorted_alerts = alerts.sort { |a,b| a.updated_at <=> b.updated_at }
    rev_sorted_alerts = sorted_alerts.reverse
    if limit
      return rev_sorted_alerts[0..limit]
    else
      return rev_sorted_alerts
    end
  end

end
