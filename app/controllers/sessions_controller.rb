# frozen_string_literal: true

class SessionsController < ApplicationController
  before_action :require_no_authentication, only: %i[new create]
  before_action :require_authentication, only: %i[destroy]
  def new; end

  def create
    user = User.find_by email: params[:email]
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path
      flash[:success] = "Welcome to the app, #{user.name}"
    else
      flash[:error] = 'Incorrect email and/or password'
      redirect_to new_session_path
    end
  end

  def destroy
    session.delete :user_id
    flash[:success] = 'See you later'
    redirect_to root_url
  end
end
