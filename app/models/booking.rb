class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :vendor

  validates :date, uniqueness: {scope: [:date], :message => " already booked"}
  
end
