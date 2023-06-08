class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :notfound

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id].present?
  end

  def user_signed_in?
    current_user.present?
  end

  def require_authentication
    return if user_signed_in?

    flash[:warning] = 'You are not signed in'
    redirect_to root_path
  end

  def require_no_authentication
    return if !user_signed_in?

    flash[:warning] = 'You have been already signed in'
    redirect_to root_path
  end

  helper_method :current_user, :user_signed_in?

  def notfound
    render file: "#{Rails.root}/public/404.html", status: :not_found, layout: false
  end
end
