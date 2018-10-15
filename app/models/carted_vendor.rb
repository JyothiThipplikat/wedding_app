class CartedVendor < ApplicationRecord
  belongs_to :vendor
  belongs_to :order, optional: true
  has_one :user, through: :order

end

