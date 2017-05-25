class UsersController < ApplicationController
  def index
      render json: User.all
  end

  def new
  end

  def total
      @user = User.all
      render json: @user.count
  end

  def show
      @user = User.find(params[:id])
      render json: @user
  end

  def edit
      @user = User.find(params[:id])
  end

  def update
       @user = User.find(params[:id])
       @user.update(name: params[:name])
       @user.save
       redirect_to "/users"
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

end
