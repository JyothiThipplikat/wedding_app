class Api::CartedVendorsController < ApplicationController
  
  def index
    @carted_vendors = current_user&.shopping_cart

    render 'index.json.jbuilder'
  end

  def create
    @carted_vendor = CartedVendor.new(
                                      vendor_id: params[:vendor_id],
                                      status: "carted"

      )

    if @carted_vendor.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @carted_vendor.erros.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    @carted_vendor = CartedVendor.find(params[:id])
    @carted_vendor.update(status: "removed")
    render json: {status: "Vendor was removed from the cart."}
  end
end
