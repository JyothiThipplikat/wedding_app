class Api::VendorsController < ApplicationController

  def index
    @vendors = current_user.shopping_cart
    
    render 'index.json.jbuilder'
  end

  
  def create
    @vendor = Vendor.new(
                        user_id: params[:user_id],
                        company_name: params[:company_name],
                        address: params[:address],
                        phone_number: params[:phone_number],
                        description: params[:description],
                        email: params[:email],
                        availability: params[:availability],
                        price: params[:price]
                        )

    if @vendor.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @vendor.errors.full_messages},
      status: :unprocessable_entity
    end
  end

  def show
    @vendor = Vendor.find(params[:id])
    render 'show.json.jbuilder'
  end

  def update
    @vendor = Vendor.find(params[:id])

    @vendor.company_name = params[:company_name] || @vendor.company_name
    @vendor.address = params[:address] || @vendor.address
    @vendor.phone_number = params[:phone_number] || @vendor.phone_number
    @vendor.description = params[:description] || @vendor.description
    @vendor.email = params[:email] || @vendor.email
    @vendor.availability = params[:availability] || @vendor.availability
    @vendor.price = params[:price] || @vendor.price

    if @vendor.save
      render "show.json.jbuilder"
    else
      render json: {errors:@vendors.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    @vendor = Vendor.find(params[:id])
    @vendor.destroy
    render json: {message: "You deleted the vendor!"}
  end
end
