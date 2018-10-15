class Vendor < ApplicationRecord
  belongs_to :user

  has_many :images
  has_many :vendor_tags
  has_many :tags, through: :vendor_tags

  has_many :reviews
  has_many :bookings
  
  has_many :carted_vendors
  has_many :orders, through: :carted_vendors
 
end
