class Api::OrdersController < ApplicationController
  before_action :authenticate_user
  
  def index 
   @orders = current_user.orders
   render 'index.json.jbuilder'
  end

  def create 
    @order = Order.create(user_id: current_user.id)
    @order.find_total
    @order.save
    render 'show.json.jbuilder'

  end
end
