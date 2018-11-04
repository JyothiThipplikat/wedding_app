class Api::OrdersController < ApplicationController
  before_action :authenticate_user
  
  def index 
   @orders = current_user.orders
   render 'index.json.jbuilder'
  end

  def create 
    @order = Order.create(user_id: current_user.id)
    @order.save
    carted_vendors = CartedVendor.where(status: "carted", user_id: current_user)
    carted_vendors.each do |carted_vendor|
      carted_vendor.order_id = @order.id 
      carted_vendor.status = "purchased" 
      carted_vendor.save   
    end
    @order.find_total
    render 'show.json.jbuilder'
  end
end
