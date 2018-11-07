class Api::UsersController < ApplicationController
  
  def create
    @user = User.new(
                    email: params[:email],
                    password: params[:password],
                    password_confirmation: params[:password_confirmation],
                    date: params[:date],
                    budget: params[:budget]
                   )

    if @user.save
      render json: {message: 'User created successfully'}, status: :created
    else
      render json: {errors: user.errors.full_messages}, status: :bad_request
    end
  end

  def show
    render 'customer_show.json.jbuilder'
    # if current_user.merchant? == false
    #   render 'customer_show.json.jbuilder'
    # else 
    #   render 'merchant_show.json.jbuilder'
    # end
  end


  def update
    @user = User.find(params[:id])
    
    if @user && current_user.id == @user.id
      @user.date = params[:date] || @user.date
      @user.budget = params[:budget] || @user.budget

      if @user.save
        render "customer_show.json.jbuilder"
      else
        render json: {errors:@users.errors.full_messages}, status: :unprocessable_entity
      end
    else
      render json: {errors: ["You are not authorized to update this user!"]}, status: :unprocessable_entity
    end
  end
end