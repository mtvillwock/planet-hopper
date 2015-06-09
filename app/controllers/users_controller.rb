class UsersController < ApplicationController
  def index
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    # @user = User.find(params[:username])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save!
      redirect_to '/login'
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
    # @user = User.find(params[:username])
  end

  def update
    @user = User.find(params[:id])
    # @user = User.find(params[:username])
    if @user.update(user_params)
      redirect_to 'show'
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    # @user = User.find(params[:username])
    @user.destroy
    redirect_to '/'
  end
end
