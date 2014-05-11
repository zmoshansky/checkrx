class RxAlert < ActiveRecord::Base
  belongs_to :pharmacy
  attr_accessible :brand_name, :din, :expected_restock, :generic_name, :message, :availability, :build_status
  # validates_inclusion_of :availability, :in => [:avail, :low, :out]
  before_create { self.build_status = 'incomplete' }

   def availability
     read_attribute(:availability).to_sym unless read_attribute(:availability).nil?
   end

   def availability= (value)
     write_attribute(:availability, value.to_s)
   end

   def availability_human
     if self.availability == :avail
       return 'Available'
     elsif self.availability == :low
       return 'Limited'
     else
       return 'Out of Stock'
     end
   end

  def self.all
    self.where(build_status: 'complete')
  end

  def self.get_rev_sorted_alerts(limit)
    alerts = self.all
    self.get_rev_sorted_alerts_from_array(alerts, limit)
  end

  def self.get_rev_sorted_alerts_from_array(alerts, limit)
    sorted_alerts = alerts.sort { |a,b| a.updated_at <=> b.updated_at }
    rev_sorted_alerts = sorted_alerts.reverse
    if limit
      return rev_sorted_alerts[0..limit]
    else
      return rev_sorted_alerts
    end
  end

  def mark_complete!
    write_attribute(:build_status, 'complete')
    if self.availability.nil?
      write_attribute(:availability, 'out')
    end
    self.save
  end

  def set_name!
    if self.brand_name.nil?
      drug = Drug.find_by_din(self.din)
      return nil if drug.nil?
      self.brand_name = drug.brand_name
      return self.save
    end
    return false
  end

end
