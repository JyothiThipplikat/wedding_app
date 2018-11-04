class Order < ApplicationRecord
  belongs_to :user

  has_many :carted_vendors
  has_many :vendors, through: :carted_vendors

  def find_total
    vendors = find_vendors 
    sum = 0
    vendors.each do |vendor|
      puts vendor.price
      sum += vendor.price 
    end
    self.total = sum
    p total
  end

  def find_vendors
    carted_vendors = CartedVendor.where(order_id: id)
    
    vendors = []
    carted_vendors.each do |carted_vendor|
      vendors << Vendor.find(carted_vendor.vendor_id)
    end
    return vendors
  end
end