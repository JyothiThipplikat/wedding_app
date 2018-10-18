class Api::ReviewsController < ApplicationController
  before_action :authenticate_user

  def index
    @reviews = current_user.reviews
    render 'index.json.jbuilder'
  end
  

  def create
    @review = Review.create(user_id: current_user.id,
                            vendor_id: params[:vendor_id],
                            post: params[:post],
                            date: params[:date]
                            )

    if @review.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @review.errors.full_messages},
      status: :unprocessable_entity
    end
    


  end

  def show
    @review = Review.find(params[:id])
    render 'show.json.jbuilder'
  end

  def update
    @review = Review.find(params[:id])

    @review.post = params[:post] || @review.post
    @review.date = params[:date] || @review.date

    if @review.save
      render "show.json.jbuilder"
    else
      render json: {errors:@reviews.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    render json: {message: "You deleted the review!"}
  end

end
