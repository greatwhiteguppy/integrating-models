class UsersController < ApplicationController
  def index
      render json: User.all
  end

  def new
  end

  def show
      @user = User.find(params[:id])
      render json: @user
  end

  def edit
      @user = User.find(params[:id])
  end

  def create
      user = User.new(name: params[:name])
      if user.valid?
          user.save
          redirect_to "/users"
      else
          flash[:errors] = user.errors.full_messages
          redirect_to "/users/new"
      end
  end

  def total
  end
end
