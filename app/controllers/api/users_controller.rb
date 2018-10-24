class Api::UsersController < ApplicationController
  
  def create
    @user = User.new(
                    email: params[:email],
                    password: params[:password],
                    password_confirmation: params[:password_confirmation],
                    date: params[:date].to_i,
                    budget: params[:budget]
                   )

    if @user.save
      render json: {message: 'User created successfully'}, status: :created
    else
      render json: {errors: user.errors.full_messages}, status: :bad_request
    end
  end

  def show
    @user= User.find(params[:id])
    render 'customer_show.json.jbuilder'
  end


  def update
    @user = User.find(params[:id])

    @user.date = params[:date] || @user.date
    @user.budget = params[:budget] || @user.budget

    if @user.save
      render "customer_show.json.jbuilder"
    else
      render json: {errors:@users.errors.full_messages}, status: :unprocessable_entity
    end
  end
end