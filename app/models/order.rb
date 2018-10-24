class Order < ApplicationRecord
  belongs_to :user

  has_many :carted_vendors
  has_many :vendors, through: :carted_vendors

  def find_total
    self.total = 0
    carted_vendors.each do |carted_vendor|
      self.total += carted_vendor.vendor.price 
    end
    return self.total
  end

end