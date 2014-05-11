class RxAlert < ActiveRecord::Base
  belongs_to :pharmacy
  attr_accessible :brand_name, :din, :expected_restock, :generic_name
  validates_inclusion_of :availability, :in => [:avail, :low, :out]

   def availability
     read_attribute(:availability).to_sym
   end

   def availability= (value)
     write_attribute(:availability, value.to_s)
   end

  def self.get_rev_sorted_alerts(limit)
    alerts = self.all
    self.get_rev_sorted_alerts_from_array(alerts, limit)
  end
  def self.get_rev_sorted_alerts_from_array(alerts, limit)
    rev_sorted_alerts = alerts.sort { |a,b| a.updated_at <=> b.updated_at }
    if limit
      return rev_sorted_alerts[0..limit]
    else
      return rev_sorted_alerts
    end
  end
end
