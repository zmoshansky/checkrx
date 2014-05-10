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
