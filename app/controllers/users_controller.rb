class UsersController < ApplicationController
  before_action :authorize, except: [:index, :new, :create]
  def index
    @user = User.new
  end

  def show
    @user = User.find_by(id: session[:user_id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.password = params[:password]
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def edit
    @user = User.find_by(id: session[:user_id])
  end

  def update
    @user = User.find_by(id: session[:user_id])
    if @user.update(user_params)
      redirect_to 'show'
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find_by(id: session[:user_id])
    @user.destroy
    redirect_to '/'
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
