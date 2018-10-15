class Api::OrdersController < ApplicationController
  def index 
   @orders = Order.all
   render'index.json.jbuilder'
  end

  def create 
    @order = Order.create[user_id: current_user]
    @order.total
    @order.save
    render 'show.json.jbuilder'
  end
end
