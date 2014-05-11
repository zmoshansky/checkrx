class Pharmacy < ActiveRecord::Base
  attr_accessible :address, :city, :email, :name, :phone, :postal_code
  has_many :users, as: :employable
end
