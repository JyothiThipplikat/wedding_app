class Review < ApplicationRecord
  belongs_to :user
  belongs_to :vendor

  validates :user_id, uniqueness: { scope: :vendor_id, message: "You can only leave one review per each vendor."}
end
