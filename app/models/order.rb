class Order < ApplicationRecord
  belongs_to :user

  has_many :carted_vendors
  has_many :vendors, through: :carted_vendors


  def total
    carted_vendors.sum { |carted_vendor| vendor.price }
  end

end