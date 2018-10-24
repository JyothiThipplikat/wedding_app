class Api::CartedVendorsController < ApplicationController
before_action :authenticate_user

  def index
    @carted_vendors = current_user.shopping_cart
    render 'index.json.jbuilder'
  end

  def create
    @carted_vendor = CartedVendor.new(
                                      vendor_id: params[:vendor_id],
                                      status: "carted",
                                      order_id: params[:order_id],
                                      user_id: current_user.id
                                      )

    if @carted_vendor.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @carted_vendor.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def show
    @carted_vendor = CartedVendor.find(params[:id])
    render 'show.json.jbuilder'
  end

  def destroy
    @carted_vendor = CartedVendor.find(params[:id])
    @carted_vendor.update(status: "removed")
    render json: {status: "Vendor was removed from the cart."}
  end
end
