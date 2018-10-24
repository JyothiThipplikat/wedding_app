class Api::BookingsController < ApplicationController
  before_action :authenticate_user
  
  def create
    @booking = Booking.create(user_id: current_user.id,
                              vendor_id: params[:vendor_id]
                              )
      
      if @booking.save
         vendor.availability == false
         render 'show.json.jbuilder'
    end
  end
end
