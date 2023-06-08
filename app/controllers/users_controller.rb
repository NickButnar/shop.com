class UsersController < ApplicationController

  before_action :require_no_authentication

  def new
    user = User.new
    render locals: { user: user }
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to root_path
      flash[:success] = "Welcome to the app, #{user.name}"
    else
      flash[:error] = 'Abort registration. Please, try again'
      render :new, locals: { user: user }
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :surname, :email, :password, :password_confirmation)
  end
end
