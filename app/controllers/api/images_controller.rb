class Api::ImagesController < ApplicationController
  def index
    @images = Image.all
    
    render 'index.json.jbuilder'
  end

  def create
    @image = Image.new(
                      vendor_id: params[:vendor_id],
                      url: params[:url],
                      primary_image: params[:primary_image]
                      )

    if @image.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @image.errors.full_messages},
      status: :unprocessable_entity
    end
  end

  def show
    @image = Image.find(params[:id])
    render 'show.json.jbuilder'
  end

  def update
    @image = Image.find(params[:id])

    @image.vendor_id = params[:vendor_id] || @image.vendor_id
    @image.url = params[:url] || @image.url
    @image.primary_image = params[:primary_image] || @image.primary_image

    if @image.save
      render "show.json.jbuilder"
    else
      render json: {errors:@products.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    render json: {message: "You deleted the image!"}
  end
end
