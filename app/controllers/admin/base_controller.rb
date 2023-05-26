class Admin::BaseController < ApplicationController

  before_action :authenticate_user!
  helper_method :current_user

  private

  def current_user
    if admin_user_admin_signed_in?
      current_user_admin
    else
      super
    end
  end
end
