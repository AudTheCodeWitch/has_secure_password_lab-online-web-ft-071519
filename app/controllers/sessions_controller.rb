class SessionsController < ApplicationController
  def create
    @user = User.find_by(name: params[:user][:name])
   # binding.pry

    return head(:forbidden) unless @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    redirect_to root_path
  end

  def new
    @user = User.new
  end

  def destroy
    session.delete :user_id
    redirect_to login_path
  end
end

