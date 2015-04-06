class LoginController < ApplicationController

  def dologin
    @user = User.new(tag_params)
    user = User.find_by_name(@user.name)
    if user==nil or user.name != @user.name
      render :login
    else
      session[:user] = user
      redirect_to blogs_path
    end
  end

  def login
    @user = User.new
  end

  private
  def tag_params
    params.require(:user).permit(:name,:password)
  end
end
