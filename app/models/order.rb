class Order < ApplicationRecord
  belongs_to :user

  has_many :carted_vendors
  has_many :vendors, through: :carted_vendors

  def find_total
    carted_vendors.each do |carted_vendor|
      self.total += carted_vendor.vendor.price 
    end
    p self.total
  end
end