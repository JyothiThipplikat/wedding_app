class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :vendor

 validate :no_double_bookings
 
 def no_double_bookings
   unless vendor.available?(user.date)
     errors.add(:vendor, "can't be booked on this date")
   end
 end
end
