class CartedVendor < ApplicationRecord
  belongs_to :vendor
  belongs_to :order, optional: true 

end

