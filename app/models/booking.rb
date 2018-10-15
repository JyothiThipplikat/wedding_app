class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :vendor

  validates :booking, presence: true
  
end
