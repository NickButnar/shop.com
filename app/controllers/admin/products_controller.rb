# class Admin::ProductsController < ApplicationController
#   def index
#     if admin_user_admin_signed_in?
#       # @products = Product.all
#     else
#       redirect_to new_admin_user_admin_session_path
#     end
#   end

#   def current_user
#     Current.user
#   end
# end


class Admin::ProductsController < ApplicationController
  def index
    if admin_user_admin_signed_in?
      # @products = Product.all
    else
      redirect_to new_admin_user_admin_session_path
    end
  end
end
