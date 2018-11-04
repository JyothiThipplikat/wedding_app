class Api::BookingsController < ApplicationController
  before_action :authenticate_user
  
  def create
    @booking = Booking.create(user_id: current_user.id,
                              vendor_id: params[:vendor_id]
                              )
      
    @booking.save
    @booking.no_double_bookings
    render 'show.json.jbuilder'
  end
end
