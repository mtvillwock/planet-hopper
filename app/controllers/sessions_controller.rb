class SessionsController < ApplicationController
  def create
    @user = User.find(params[:id])
    # @user = User.find(params[:username])
    if @user && @user.password == params[:password]
      if session[:id].nil?
        session[:id] = @user.id
      else
        redirect_to user_path(@user)
      end
    else
      render 'new'
    end
  end

  def destroy
    session[:id] = nil
    redirect_to '/'
  end
end
