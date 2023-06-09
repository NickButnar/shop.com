# frozen_string_literal: true

class UsersController < ApplicationController

  before_action :require_no_authentication, only: %i[new create]
  before_action :require_authentication, only: %i[edit update]
  before_action :set_user!, only: %i[edit update]

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

  def edit
    user = User.find(params[:id])
    render locals: { user: user }
  end

  def update
    user = User.find(params[:id])
    render locals: { user: user }

    if user.update(user_params)

      flash[:success] = 'Your profile was successfully updated'
      redirect_to edit_user_path(current_user)
    else
      render :edit
    end
  end

  private

  def set_user!
    user = User.find(params[:id])
    render locals: { user: user }
  end

  def user_params
    params.require(:user).permit(:name, :surname, :email, :password, :password_confirmation)
  end
end
